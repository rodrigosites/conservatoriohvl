class Aluno < ActiveRecord::Base
  #associações no banco de dados
  belongs_to :cliente
  has_many :matriculas, :dependent => :destroy

  #validações
  validates :cpf,:rg, uniqueness: true
  validates :cliente_id, :nome, :endereco, :rg, :cpf, :telefone, :celular, presence: true
end
