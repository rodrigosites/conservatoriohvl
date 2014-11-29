class ProfessoresController < ApplicationController
   before_action :set_professor, only: [:show, :edit, :update, :destroy]

  def index
    @professores = Professor.all
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
    @professor.destroy
    respond_to do |format|
      format.html { redirect_to professores_path }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_professor
      @professor = Professor.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def professor_params
      params.require(:professor).permit(:nome, :endereco, :rg, :cpf, :telefone, :celular)
    end
end

