# encoding: UTF-8
require 'docx'
include ActionView::Helpers::NumberHelper
include ApplicationHelper

class MatriculasController < ApplicationController
  before_action :set_matricula, only: [:show, :edit, :update, :destroy, :encerrar, :refaz_contrato]

  def index
    @matriculas = Matricula.search(params[:search], params[:page])
  end

  def show
  end

  def new
    @matricula = Matricula.new
  end

  def edit
  end

  def create
    if params[:pratica][:horario_id].blank?
      redirect_to new_matricula_path, alert: "O campo Horário do curso principal não pode ficar em branco"
      return
    end
    
    @matricula = Matricula.new(matricula_params)
    respond_to do |format|
      if @matricula.save
        gera_notificacao("admin",@matricula, action_name)
        # salva na tabela many_to_many
        @aula = Aula.new
        @aula.horario_id = params[:pratica][:horario_id]
        @aula.matricula_id = @matricula.id
        if @matricula.curso.nome == "Teoria"
          @aula.teoria = true
        elsif @matricula.curso.nome == "Musicalização Infantil"
          @aula.musicalizacao = true
        end
        @aula.save
        unless params[:teorica][:horario_id].blank?
          @aula = Aula.new
          @aula.horario_id = params[:teorica][:horario_id]
          @aula.matricula_id = @matricula.id
          if params[:teorica][:teoria] == "Teoria"
            @aula.teoria = true
          elsif params[:teorica][:teoria] == "Musicalização Infantil"
            @aula.musicalizacao = true
          end
          @aula.save
        end

        gera_contrato(@matricula)

        format.html { redirect_to @matricula, notice: "Matricula criada com sucesso. O contrato pode ser acessado em 
          \"/Contratos/#{@matricula.data_matricula.to_date.year}/#{@matricula.aluno.cliente.id} - #{@matricula.aluno.cliente.nome} - Matrícula #{@matricula.id}.docx\"" }
        format.json { render action: 'show', status: :created, location: @matricula }
      else
        format.html { render action: 'new' }
      end
    end
  end

  def update
    if @matricula.update(matricula_params)
      gera_notificacao("admin",@matricula, action_name)
      # no caso de reativação de matrícula, a aula precisa ser criada novamente.
      if @matricula.aulas.size < 1
        @aula = Aula.new
        @aula.horario_id = params[:pratica][:horario_id]
        @aula.matricula_id = @matricula.id
        if @matricula.curso.nome == "Teoria"
          @aula.teoria = true
        elsif @matricula.curso.nome == "Musicalização Infantil"
          @aula.musicalizacao = true
        end
        @aula.save
      end
      # atualiza a associação passando (true) como argumento
      @matricula.aulas(true) 
      # verifica se o curso antes era apenas teoria e se tornou agora na edição pratica/teoria, sendo o caso corrige a primeira aula da matricula para pratica
      unless @matricula.curso.nome == "Teoria" || @matricula.curso.nome == "Musicalização Infantil"
        @matricula.aulas.first.update_attribute(:teoria,false)
        @matricula.aulas.first.update_attribute(:musicalizacao,false)
      else
        # ao contrário, se o curso virou apenas teoria, remove a segunda aula
        if @matricula.aulas.size > 1
          @matricula.aulas.last.destroy
        end
      end
      @matricula.aulas.each do |aula|
        if (aula.teoria || aula.musicalizacao) && @matricula.aulas.size > 1 #@matricula.valor_mensal > Circular.where(vigente: true).first.valor_extra
          aula.update_attribute(:horario_id,params[:teorica][:horario_id])
        else            
          aula.update_attribute(:horario_id,params[:pratica][:horario_id])
        end
      end
      # verifica se já havia um horário de teoria cadastrado para o curso na tabela many_to_many e se não tinha, cria o horário
      if params[:teorica][:horario_id] && @matricula.aulas.size == 1
        @aula = Aula.new
        @aula.horario_id = params[:teorica][:horario_id]
        @aula.matricula_id = @matricula.id
        if params[:teorica][:teoria] == "Teoria"
          @aula.teoria = true
        elsif params[:teorica][:teoria] == "Musicalização Infantil"
          @aula.musicalizacao = true
        end
        @aula.save
        # atualiza a associação passando (true) como argumento
        @matricula.aulas(true) 
      end
      # verifica a mudança de tipo de teoria na alteração
      if params[:teorica][:teoria] == "Teoria" && @matricula.aulas.last.musicalizacao
        @matricula.aulas.last.update_attribute(:teoria,true)
        @matricula.aulas.last.update_attribute(:musicalizacao,false)
      elsif params[:teorica][:teoria] == "Musicalização Infantil" && @matricula.aulas.last.teoria
        @matricula.aulas.last.update_attribute(:musicalizacao,true)
        @matricula.aulas.last.update_attribute(:teoria,false)
      end
      gera_contrato(@matricula)
      respond_to do |format|
        format.html { redirect_to @matricula, notice: "O contrato foi gerado com sucesso e pode ser acessado em 
          \"/Contratos/#{@matricula.data_matricula.to_date.year}/#{@matricula.aluno.cliente.id} - #{@matricula.aluno.cliente.nome} - Matrícula #{@matricula.id}.docx\"" }
      end
      else
        respond_to do |format|
          format.html { render action: 'edit' }
        end
      end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @inativa = Matinativa.new
    @inativa.aluno_id = @matricula.aluno_id
    @inativa.curso_id = @matricula.curso_id
    @inativa.data_matricula = @matricula.data_matricula
    @inativa.termino_matricula = Date.today
    @inativa.ano = @matricula.ano
    @inativa.teoria_ano = @matricula.teoria_ano
    @inativa.valor_mensal = @matricula.valor_mensal
    @inativa.id_ativa = @matricula.id
    if @matricula.horarios.size > 1
      @inativa.professor_id = @matricula.horarios.first.professor_id
      @inativa.dia_pratica = @matricula.horarios.first.dia[0]
      @inativa.professor_teoria_id = @matricula.horarios.last.professor_id
      @inativa.dia_teoria = @matricula.horarios.last.dia[0]
    else
      @inativa.professor_id = @matricula.horarios.first.professor_id
      @inativa.dia_pratica = @matricula.horarios.first.dia[0]
    end
    if @inativa.save
      gera_notificacao("admin",@matricula, action_name)
      @matricula.destroy
      respond_to do |format|
        format.html { redirect_to matriculas_path }
      end
    end
  end

  def busca_professores
    @curso = Curso.find params[:curso_id]
    @professores = @curso.professores.order("nome")
  end

  def busca_horarios
    @professor = Professor.find params[:professor_id]
    @horarios = @professor.horarios.order("dia, horario")
  end

  def busca_horarios_teoria
    @professor = Professor.find params[:professor_id]
    @horarios = @professor.horarios.order("dia, horario")
  end

  def busca_dados_curso
    @curso = Curso.find params[:curso_id]
  end

  def tipo_teoria
    if params[:tipo_teoria] == "Teoria"
      @curso = Curso.where(nome: params[:tipo_teoria]).first
      if @curso.try(:professores)
        @professores = @curso.professores
      else
        @professor = Professor.new
        @professor.nome = "Sem professores de teoria cadastrados..."
        @professores = [@professor]
      end
    elsif params[:tipo_teoria] == "Musicalização Infantil"
      @curso = Curso.where(nome: params[:tipo_teoria]).first
      if @curso.try(:professores)
        @professores = @curso.professores
      else
        @professor = Professor.new
        @professor.nome = "Sem professores de musicalização infantil cadastrados..."
        @professores = [@professor]
      end
    end
  end

  def encerradas
    @inativas = Matinativa.search(params[:search], params[:page])
  end

  def altera_encerramento
    @inativa = Matinativa.find(params[:id])
    @inativa.update_attribute(:termino_matricula, params[:nova_data])
    respond_to do |format|
      format.html { redirect_to matriculas_encerradas_path }
      format.js
    end
  end

  def refaz_contrato
    respond_to do |format|
      begin
        gera_contrato(@matricula)
      rescue Errno::EACCES  
        redirect_to @matricula, alert: "Não foi possível gerar o contrato. O arquivo está aberto no Microsoft Word."
        return
      end
      format.html { redirect_to @matricula, notice: "O contrato foi gerado com sucesso e pode ser acessado em 
          \"/Contratos/#{@matricula.data_matricula.to_date.year}/#{@matricula.aluno.cliente.id} - #{@matricula.aluno.cliente.nome} - Matrícula #{@matricula.id}.docx\"" }
    end
  end

  def rematricular
    @circular = Circular.where(vigente: true).first
  end

  def rematricular_base
    @matriculas = Matricula.all
    @matriculas.each do |matricula|
      # registra a matricula com a data atual nas inativas
      @inativa = Matinativa.new
      @inativa.aluno_id = matricula.aluno_id
      @inativa.curso_id = matricula.curso_id
      @inativa.data_matricula = matricula.data_matricula
      @inativa.termino_matricula = Date.civil(matricula.data_matricula.to_date.year,-1,-1)
      @inativa.ano = matricula.ano
      @inativa.teoria_ano = matricula.teoria_ano
      @inativa.valor_mensal = matricula.valor_mensal
      @inativa.id_ativa = matricula.id
      if matricula.horarios.size > 1
        @inativa.professor_id = matricula.horarios.first.professor_id
        @inativa.dia_pratica = matricula.horarios.first.dia[0]
        @inativa.professor_teoria_id = matricula.horarios.last.professor_id
        @inativa.dia_teoria = matricula.horarios.last.dia[0]
      else
        @inativa.professor_id = matricula.horarios.first.professor_id
        @inativa.dia_pratica = matricula.horarios.first.dia[0]
      end
      @inativa.save
      #atualiza a data de matricula para a data desejada
      matricula.update_attribute(:data_matricula, params[:data])
      if matricula.teoria_ano != 99 || matricula.curso.nome == "Musicalização Infantil" || matricula.curso.nome == "Teoria"
        if matricula.curso.basico?
          mensalidade = Circular.where(vigente: true).first.valor_mensalidade
        else
          mensalidade = Circular.where(vigente: true).first.valor_profissionalizante
        end
        matricula.update_attribute(:valor_mensal, mensalidade)
      else
        matricula.update_attribute(:valor_mensal, Circular.where(vigente: true).first.valor_extra)
      end
    end
    redirect_to matriculas_path, notice: "Base de alunos rematriculada com sucesso para o dia #{params[:data]}."
  end

  def reativar_matricula
    @inativa = Matinativa.find(params[:id])
    @matricula = Matricula.new
    @matricula.id =  @inativa.id_ativa
    @matricula.aluno_id = @inativa.aluno_id
    @matricula.curso_id = @inativa.curso_id
    @matricula.data_matricula = @inativa.data_matricula
    @matricula.ano = @inativa.ano
    @matricula.teoria_ano = @inativa.teoria_ano
    @matricula.valor_mensal = @inativa.valor_mensal
    if @matricula.save
      @inativa.destroy
      respond_to do |format|
        format.html { redirect_to edit_matricula_path(@matricula), notice: "Matrícula nº #{@matricula.id} - #{@matricula.aluno.nome} reativada com sucesso." }
      end
    end
  end
  
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_matricula
      @matricula = Matricula.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def matricula_params
      params.require(:matricula).permit(:aluno_id, :curso_id, :data_matricula, :ano, :valor_mensal, :termino_matricula,
        :teoria_ano)
    end

    def gera_contrato(matricula)
      doc = Docx::Document.open("#{Rails.root}/private/contratos/template.docx")
      
      # página 1
      doc.bookmarks['cliente_id1'].insert_text_after(matricula.aluno.cliente.id)
      doc.bookmarks['matricula_id1'].insert_text_after(matricula.id)
      doc.bookmarks['curso_nome1'].insert_text_after(matricula.curso.nome)
      doc.bookmarks['dia_pratica'].insert_text_after(dia(matricula.aulas.first.horario.dia).pluralize)
      doc.bookmarks['horario_pratica'].insert_text_after(hora(matricula.aulas.first.horario.horario))
      doc.bookmarks['termino_pratica'].insert_text_after(hora(matricula.aulas.first.horario.horario + 50*60))
      doc.bookmarks['professor_pratica'].insert_text_after(matricula.aulas.first.horario.professor.nome)
      if matricula.horarios.size > 1
        doc.bookmarks['dia_teoria'].insert_text_after(dia(matricula.aulas.last.horario.dia).pluralize)
        doc.bookmarks['horario_teoria'].insert_text_after(hora(matricula.aulas.last.horario.horario))
        doc.bookmarks['termino_teoria'].insert_text_after(hora(matricula.aulas.last.horario.horario + 50*60))
        doc.bookmarks['professor_teoria'].insert_text_after(matricula.aulas.last.horario.professor.nome)
      end
      doc.bookmarks['cliente_email'].insert_text_after(matricula.aluno.cliente.email)
      doc.bookmarks['aluno_nome'].insert_text_after(matricula.aluno.nome)
      doc.bookmarks['aluno_nascimento'].insert_text_after(I18n.l(matricula.aluno.nascimento))
      doc.bookmarks['aluno_pai'].insert_text_after(matricula.aluno.pai)
      doc.bookmarks['aluno_mae'].insert_text_after(matricula.aluno.mae)
      doc.bookmarks['aluno_endereco'].insert_text_after(matricula.aluno.cliente.endereco)
      doc.bookmarks['aluno_bairro'].insert_text_after(matricula.aluno.cliente.bairro)
      doc.bookmarks['aluno_cep'].insert_text_after(matricula.aluno.cliente.cep)
      doc.bookmarks['aluno_cidade'].insert_text_after(matricula.aluno.cliente.cidade)
      doc.bookmarks['aluno_uf'].insert_text_after(matricula.aluno.cliente.uf)
      doc.bookmarks['aluno_telefone'].insert_text_after(matricula.aluno.cliente.telefone)
      doc.bookmarks['aluno_celular'].insert_text_after(matricula.aluno.celular)
      doc.bookmarks['curso_nome2'].insert_text_after(matricula.curso.nome.upcase)
      doc.bookmarks['valor_total'].insert_text_after(number_to_currency(matricula.valor_mensal * (13 - matricula.data_matricula.month) + 100))
      doc.bookmarks['parcelas2'].insert_text_after(13 - matricula.data_matricula.month)
      doc.bookmarks['data_matricula'].insert_text_after(I18n.l(matricula.data_matricula.to_date, :format => :long))
      # página 2
      doc.bookmarks['cliente_id2'].insert_text_after(matricula.aluno.cliente.id)
      doc.bookmarks['matricula_id2'].insert_text_after(matricula.id)
      doc.bookmarks['aluno_nome2'].insert_text_after(matricula.aluno.nome)
      doc.bookmarks['curso_nome3'].insert_text_after(matricula.curso.nome)
      doc.bookmarks['cliente_nome1'].insert_text_after(matricula.aluno.cliente.nome)
      doc.bookmarks['cliente_nacionalidade'].insert_text_after(matricula.aluno.cliente.nacionalidade)
      doc.bookmarks['cliente_profissao'].insert_text_after(matricula.aluno.cliente.profissao)
      doc.bookmarks['cliente_rg'].insert_text_after(matricula.aluno.cliente.rg)
      doc.bookmarks['cliente_cpf'].insert_text_after(matricula.aluno.cliente.cpf)
      doc.bookmarks['cliente_endereco'].insert_text_after(matricula.aluno.cliente.endereco)
      doc.bookmarks['cliente_bairro'].insert_text_after(matricula.aluno.cliente.bairro)
      doc.bookmarks['cliente_cep'].insert_text_after(matricula.aluno.cliente.cep)
      doc.bookmarks['cliente_cidade'].insert_text_after(matricula.aluno.cliente.cidade)
      doc.bookmarks['cliente_uf'].insert_text_after(matricula.aluno.cliente.uf)
      doc.bookmarks['circular_numero'].insert_text_after(Circular.where(vigente: true).first.numero_circular)
      doc.bookmarks['circular_data'].insert_text_after(I18n.l(Circular.where(vigente: true).first.data_circular))
      doc.bookmarks['circular_numero2'].insert_text_after(Circular.where(vigente: true).first.numero_circular)
      doc.bookmarks['circular_data2'].insert_text_after(I18n.l(Circular.where(vigente: true).first.data_circular))
      # página 5
      taxa_matricula = Circular.where(vigente: true).first.taxa_matricula
      doc.bookmarks['valor_total2'].insert_text_after(number_to_currency(matricula.valor_mensal * (13 - matricula.data_matricula.month) + taxa_matricula))
      doc.bookmarks['valor_mensal2'].insert_text_after(number_to_currency(matricula.valor_mensal + taxa_matricula))
      doc.bookmarks['valor_mensal3'].insert_text_after(number_to_currency(matricula.valor_mensal))
      doc.bookmarks['parcelas'].insert_text_after(12 - matricula.data_matricula.month)
      doc.bookmarks['mes_inicio'].insert_text_after(I18n.l(matricula.data_matricula, :format => "%B").upcase)
      doc.bookmarks['ano_vigente'].insert_text_after(matricula.data_matricula.year)
      doc.bookmarks['ano_vigente3'].insert_text_after(matricula.data_matricula.year)
      # página 6
      doc.bookmarks['data_matricula2'].insert_text_after(I18n.l(matricula.data_matricula.to_date, :format => :long))

      dir = "#{Rails.root}/private/contratos/#{matricula.data_matricula.to_date.year}"
      Dir.mkdir(dir) unless File.exists?(dir)

      doc.save("#{Rails.root}/private/contratos/#{matricula.data_matricula.to_date.year}/#{matricula.aluno.cliente.id} - #{matricula.aluno.cliente.nome} - Matrícula #{matricula.id}.docx")
      
      true
    end
end
