module ProfessoresHelper
    # Método para acessar o banco pela View (não quebrar a regra MVC de acesso a base pela View)
  def get_disponibilidades (idprofessor)
      @disponibilidades = Disponibilidade.where("idprofessor = #{idprofessor}").order('dia,horario')
  end

end
