module CursosHelper
  def get_professores(curso)
    @professores = curso.professores
  end
end
