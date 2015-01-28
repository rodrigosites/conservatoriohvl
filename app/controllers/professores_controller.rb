class ProfessoresController < ApplicationController
  before_action :set_professor, only: [:show, :edit, :update, :destroy]

  def index
    @professores = Professor.search(params[:search], params[:page])
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

    respond_to do |format|
      if @professor.save
        gera_notificacao("admin",@professor)
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
    @inativo = ProfessoresInativo.new
    @inativo.nome = @professor.nome
    @inativo.endereco = @professor.endereco
    @inativo.rg = @professor.rg
    @inativo.cpf = @professor.cpf
    @inativo.telefone = @professor.telefone
    @inativo.celular = @professor.celular
    @inativo.email = @professor.email
    @inativo.nascimento = @professor.nascimento
    @inativo.bairro = @professor.bairro
    @inativo.cidade = @professor.cidade
    @inativo.uf = @professor.uf
    @inativo.cep = @professor.cep
    @inativo.pai = @professor.pai
    @inativo.mae = @professor.mae
    @inativo.nacionalidade = @professor.nacionalidade
    @inativo.profissao = @professor.profissao
    @inativo.escolaridade = @professor.escolaridade
    @inativo.id_ativo = @professor.id
    if @inativo.save
      @professor.destroy
      respond_to do |format|
        format.html { redirect_to professores_path}
        format.json { head :no_content }
      end
    end
  end

  def inativos
    @inativos = ProfessoresInativo.search(params[:search], params[:page])
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_professor
      @professor = Professor.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def professor_params
      params.require(:professor).permit(:nome, :endereco, :rg, :cpf, :telefone, :celular, :email, :nascimento, :bairro, :cidade,
        :uf, :cep, :pai, :mae, :nacionalidade, :profissao, :escolaridade)
    end
end

