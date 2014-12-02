module CursosHelper
  def get_professores(curso)
    @professores = curso.professores
  end

  def get_leciona(curso,professor)
    @leciona = Leciona.find_by(curso_id: curso, professor_id: professor)
  end
end
