class CursosProfessoresController < ApplicationController
  
  def index
    @cursosprofessores = CursosProfessores.all
  end

  # NEW referente a associação HABTM entre os modelos Curso e Professor
  def new
    @cursosprofessores = CursosProfessores.new
  end

  # CREATE referente a associação HABTM entre os modelos Curso e Professor
  def create(idprofessor)
    @curso = Curso.new(curso_params)
    if @curso.professores << Professor.find(idprofessor)
       format.html { redirect_to @curso, notice: "Vinculo criado com sucesso." }
    else
      format.html { render action: 'vincula_professor_new' }
    end
  end

  private
    # Never trust parameters from the scary internet, only allow the white list through.
  def cursos_professores_params
      params.require(:curso).permit(:idcurso,:idprofessor)
  end
end
