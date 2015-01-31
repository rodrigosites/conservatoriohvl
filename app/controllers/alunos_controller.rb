class AlunosController < ApplicationController
before_action :set_aluno, only: [:show, :edit, :update, :destroy]

  def index
    @alunos = Aluno.search(params[:search], params[:page])
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
    @inativo = AlunosInativo.new
    @inativo.cliente_id = @aluno.cliente_id
    @inativo.nome = @aluno.nome
    @inativo.endereco = @aluno.cliente.endereco
    @inativo.rg = @aluno.rg
    @inativo.cpf = @aluno.cpf
    @inativo.telefone = @aluno.cliente.telefone
    @inativo.celular = @aluno.celular
    @inativo.email = @aluno.cliente.email
    @inativo.nascimento = @aluno.nascimento
    @inativo.bairro = @aluno.cliente.bairro
    @inativo.cidade = @aluno.cliente.cidade
    @inativo.uf = @aluno.cliente.uf
    @inativo.cep = @aluno.cliente.cep
    @inativo.pai = @aluno.pai
    @inativo.mae = @aluno.mae
    @inativo.nacionalidade = @aluno.nacionalidade
    @inativo.id_ativo = @aluno.id
    if @inativo.save
      @aluno.destroy
      gera_notificacao("admin",@aluno, action_name)
      respond_to do |format|
        format.html { redirect_to alunos_path}
        format.json { head :no_content }
      end
    end
  end

  def inativos
    @inativos = AlunosInativo.search(params[:search], params[:page])
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
      params.require(:aluno).permit(:cliente_id, :nome, :rg, :cpf, :celular, :nascimento, :pai, :mae, :nacionalidade)
    end
end
