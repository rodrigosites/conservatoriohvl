# coding: utf-8
class AlunosController < ApplicationController
before_action :set_aluno, only: [:show, :edit, :update, :destroy, :alterna_aluno]

  def index
    @alunos = Aluno.search(params[:search], params[:page], true)
=begin
    #remover após alterar sistema com o atributo "ativo"
    @alunos.each do |aluno|
      aluno.update_attribute(:ativo, true) unless aluno.ativo?
    end
=end
  end

  def show
  end

  def new
    @aluno = Aluno.new
  end

  def edit
  end

  def create
    @aluno = Aluno.new(aluno_params)
    @aluno.ativo = true
    respond_to do |format|
      if @aluno.save
        gera_notificacao("admin",@aluno, action_name)
        format.html { redirect_to @aluno, notice: "Aluno #{@aluno.nome} criado com sucesso." }
        format.json { render action: 'show', status: :created, location: @aluno }
      else
        format.html { render action: 'new' }
        format.json { render json: @aluno.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @aluno.update(aluno_params)
        gera_notificacao("admin",@aluno, action_name)
        format.html { redirect_to @aluno, notice: "Dados do aluno #{@aluno.nome} foram atualizados com sucesso." }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @aluno.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    if @aluno.matriculas.any?
      redirect_to alunos_path, alert: "Não foi possível excluir o(a) aluno(a) #{@aluno.nome}. Primeiro você precisa encerrar as matrículas vinculadas."
    else
      if @aluno.destroy
        gera_notificacao("admin",@aluno, action_name)
        respond_to do |format|
          format.html { redirect_to alunos_path}
          format.json { head :no_content }
        end
      end
    end
  end

  def alterna_aluno
    if @aluno.ativo?
      if @aluno.matriculas.any?
        redirect_to alunos_path, alert: "Exclusão cancelada. O aluno #{@aluno.nome} tem matriculas vinculadas. Favor encerrar as matriculas."
        return
      else  
        @aluno.update_attribute(:ativo, false)
      end
    else
      @aluno.update_attribute(:ativo, true)
    end
    redirect_to alunos_path, notice: "Status do aluno #{@aluno.nome} alterado com sucesso."
  end

  def inativos
    @inativos = Aluno.search(params[:search], params[:page], false)
=begin
    #remover após alterar sistema com o atributo "ativo"
    @inativos.each do |inativo|
      @aluno = Aluno.new
      @aluno.id = inativo.id_ativo
      @aluno.cliente_id = inativo.cliente_id
      @aluno.nome = inativo.nome
      @aluno.rg = inativo.rg
      @aluno.cpf = inativo.cpf
      @aluno.celular = inativo.celular
      @aluno.nascimento = inativo.nascimento
      @aluno.pai = inativo.pai
      @aluno.mae = inativo.mae
      @aluno.nacionalidade = inativo.nacionalidade
      @aluno.desde = inativo.desde
      @aluno.ativo = false
      @aluno.save
    end
=end
  end

  def busca_dados_cliente
    @cliente = Cliente.find params[:cliente_id]
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_aluno
      @aluno = Aluno.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def aluno_params
      params.require(:aluno).permit(:cliente_id, :nome, :rg, :cpf, :celular, :nascimento, :pai, :mae, :nacionalidade, :desde)
    end
end
