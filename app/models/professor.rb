class Professor < ActiveRecord::Base
  #associações no banco de dados
  has_many :horarios, :dependent => :destroy
  has_many :lecionam, :dependent => :destroy
  has_many :cursos, through: :lecionam, :dependent => :destroy

  #validações
  validates :cpf,:rg, uniqueness: true
  validates :nome, :endereco, :rg, :cpf, :telefone, :celular, presence: true
end
