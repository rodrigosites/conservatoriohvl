class CursosController < ApplicationController
  before_action :set_curso, only: [:show, :edit, :update, :destroy]

  def index
    @cursos = Curso.all
  end

  def show
  end

  def new
    @curso = Curso.new
  end

  def edit
  end

  def create
    @curso = Curso.new(curso_params)

    respond_to do |format|
      if @curso.save
        gera_notificacao("admin",@curso)
        format.html { redirect_to @curso, notice: "curso #{@curso.nome} criado com sucesso." }
        format.json { render action: 'show', status: :created, location: @curso }
      else
        format.html { render action: 'new' }
        format.json { render json: @curso.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @curso.update(curso_params)
        format.html { redirect_to @curso, notice: "Dados do curso #{@curso.nome} foram atualizados com sucesso." }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @curso.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @curso.destroy
    respond_to do |format|
      format.html { redirect_to cursos_path}
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_curso
      @curso = Curso.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def curso_params
      params.require(:curso).permit(:nome, :valor, :anos)
    end
end
