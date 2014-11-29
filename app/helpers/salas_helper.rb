module SalasHelper
  
  # Método para acessar o banco pela View (não quebrar a regra MVC de acesso a base pela View)
  def get_horarios (idsala)
      @horarios = Horario.where("idsala = #{idsala}").order('dia,horario')
  end

end
