# encoding: UTF-8
class ProfessoresController < ApplicationController
  before_action :set_professor, only: [:show, :edit, :update, :destroy, :controlar_horarios, :listar_alunos, :alterna_professor]

  def index
    @professores = Professor.search(params[:search], params[:page], true)
=begin    
    #remover após alterar sistema com o atributo "ativo"
    @professores.each do |professor|
      professor.update_attribute(:ativo, true) unless professor.ativo?
    end
=end
  end

  def show
  end

  def new
    @professor = Professor.new
  end

  def edit
  end

  def create
    @professor = Professor.new(professor_params)
    @professor.ativo = true
    respond_to do |format|
      if @professor.save
        gera_notificacao("admin",@professor, action_name)
        format.html { redirect_to @professor, notice: "professor #{@professor.nome} criado com sucesso." }
        format.json { render action: 'show', status: :created, location: @professor }
      else
        format.html { render action: 'new' }
        format.json { render json: @professor.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @professor.update(professor_params)
        gera_notificacao("admin",@professor, action_name)
        format.html { redirect_to @professor, notice: "Dados do professor #{@professor.nome} foram atualizados com sucesso." }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @professor.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    if @professor.destroy
      gera_notificacao("admin",@professor, action_name)
      respond_to do |format|
        format.html { redirect_to professores_path}
        format.json { head :no_content }
      end
    end
  end

  def alterna_professor
    if @professor.ativo?
      tem_aluno = false
      @professor.horarios.each do |horario|
        horario.matriculas.size > 0 ? tem_aluno = true : tem_aluno = false
      end
      if tem_aluno
        redirect_to professores_path, alert: "Exclusão cancelada. O professor #{@professor.nome} tem alunos vinculados. Favor alterar a matricula dos alunos."
        return
      else  
        @professor.update_attribute(:ativo, false)
        @professor.horarios.destroy_all
      end
    else
      @professor.update_attribute(:ativo, true)
    end
    redirect_to professores_path, notice: "Status do professor #{@professor.nome} alterado com sucesso."
  end

  def inativos
    @inativos = Professor.search(params[:search], params[:page], false)

=begin    
    #remover após alterar sistema com o atributo "ativo"
    @inativos.each do |inativo|
      @professor = Professor.new
      @professor.nome = inativo.nome
      @professor.endereco = inativo.endereco
      @professor.rg = inativo.rg
      @professor.cpf = inativo.cpf
      @professor.telefone = inativo.telefone
      @professor.celular = inativo.celular
      @professor.email = inativo.email
      @professor.nascimento = inativo.nascimento
      @professor.bairro = inativo.bairro
      @professor.cidade = inativo.cidade
      @professor.uf = inativo.uf
      @professor.cep = inativo.cep
      @professor.pai = inativo.pai
      @professor.mae = inativo.mae
      @professor.nacionalidade = inativo.nacionalidade
      @professor.profissao = inativo.profissao
      @professor.escolaridade = inativo.escolaridade
      @professor.id = inativo.id_ativo
      @professor.ativo = false
      @professor.save
    end
=end
  end

  def controlar_horarios
    @horarios = @professor.horarios.order('dia','horario').page(params[:page]).per_page(9)
  end

  def listar_alunos
    @horarios = @professor.horarios.order('dia','horario').joins(:matriculas).group('horarios.id').page(params[:page]).per_page(9)
  end

  def alunos_horario
    @horario = Horario.find(params[:horario_id])
    @aulas = @horario.aulas
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_professor
      @professor = Professor.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def professor_params
      params.require(:professor).permit(:nome, :endereco, :rg, :cpf, :telefone, :celular, :email, :nascimento, :bairro, :cidade,
        :uf, :cep, :pai, :mae, :nacionalidade, :profissao, :escolaridade, :valor_aula)
    end
end