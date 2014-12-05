module ClientesHelper

  # Método para acessar o banco pela View (não quebrar a regra MVC de acesso a base pela View)
  def get_clientes (cliente_id)
      @horarios = Aluno.where("cliente_id = #{cliente_id}")
  end

end
