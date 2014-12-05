module SalasHelper
  
  # Método para acessar o banco pela View (não quebrar a regra MVC de acesso a base pela View)
  def get_horarios (sala_id)
      @horarios = Horario.where("sala_id = #{sala_id}").order('dia,horario')
  end

end
