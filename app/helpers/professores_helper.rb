module ProfessoresHelper
    # Método para acessar o banco pela View (não quebrar a regra MVC de acesso a base pela View)
  def get_disponibilidades (professor_id)
      @disponibilidades = Disponibilidade.where("professor_id = #{professor_id}").order('dia,horario')
  end

end
