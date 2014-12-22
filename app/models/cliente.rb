class Cliente < ActiveRecord::Base
  #associações no banco de dados
  has_many :alunos, :dependent => :destroy

  #validações
  validates :cpf,:rg, uniqueness: true
  validates :nome, :endereco, :rg, :cpf, :telefone, :celular, :email, :nascimento, :bairro, :cidade, :uf,
  :cep, :pai, :mae, :nacionalidade, :profissao, presence: true
end