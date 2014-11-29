module ClientesHelper

  # Método para acessar o banco pela View (não quebrar a regra MVC de acesso a base pela View)
  def get_clientes (idcliente)
      @horarios = Aluno.where("idcliente = #{idcliente}")
  end

end
