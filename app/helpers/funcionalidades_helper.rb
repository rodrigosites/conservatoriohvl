module FuncionalidadesHelper
  
  def valor_matriculas_cliente (cliente)
    valor = 0
    n_matriculas = 0
    dados_cliente = []
    cliente.alunos.each do |aluno|
      aluno.matriculas.each do |matricula|
        valor += matricula.valor_mensal
        n_matriculas += 1
      end
    end
    dados_cliente << valor
    dados_cliente << n_matriculas
  end

end
