module MatriculasHelper
  def professores_teoria
    @curso = Curso.where(nome: "Teoria").first
    if @curso.try(:professores)
      @curso.professores
    else
      @professor = Professor.new
      @professor.nome = "Sem professores de teoria cadastrados..."
      [@professor]
    end
  end
end
