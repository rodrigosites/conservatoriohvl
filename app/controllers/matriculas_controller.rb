class MatriculasController < ApplicationController
  before_action :set_matricula, only: [:show, :edit, :update, :destroy, :encerrar]

  def index
    @matriculas = Matricula.where("termino_matricula is NULL")
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
      format.html { redirect_to matriculas_path }
      format.json { head :no_content }
    end
  end

  def busca_professores
    @curso = Curso.find params[:curso_id]
    @professores = @curso.professores
  end

  def busca_horarios
    @professor = Professor.find params[:professor_id]
    @horarios = @professor.horarios
  end

  def busca_dados_curso
    @curso = Curso.find params[:curso_id]
  end

  def encerrar
  end

  def encerradas
    @matriculas = Matricula.where("termino_matricula is not NULL")
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_matricula
      @matricula = Matricula.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def matricula_params
      params.require(:matricula).permit(:aluno_id, :curso_id, :horario_id, :data_matricula, 
        :ano, :valor_mensal, :termino_matricula)
    end
end
