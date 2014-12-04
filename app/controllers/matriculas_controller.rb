class MatriculasController < ApplicationController
  before_action :set_matricula, only: [:show, :edit, :update, :destroy]

  def index
    @matriculas = Matricula.all
  end

  def show
  end

  def new
    @matricula = Matricula.new
  end

  def edit
  end

  def create
    @matricula = Matricula.new(matricula_params)

    respond_to do |format|
      if @matricula.save
        format.html { redirect_to @matricula, notice: "Matricula criada com sucesso." }
        format.json { render action: 'show', status: :created, location: @matricula }
      else
        format.html { render action: 'new' }
        format.json { render json: @matricula.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @matricula.update(matricula_params)
        format.html { redirect_to @matricula, notice: "Dados do matricula foram atualizados com sucesso." }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @matricula.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @matricula.destroy
    respond_to do |format|
      format.html { redirect_to matriculaes_path }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_matricula
      @matricula = Matricula.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def matricula_params
      params.require(:matricula).permit(:idaluno, :idcurso, :idclasse, :data_matricula, :termino_matricula, 
        :semestre, :valor_mensal)
    end
end
