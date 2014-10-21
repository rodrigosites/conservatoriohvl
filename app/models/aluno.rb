class Aluno < ActiveRecord::Base
  #associações no banco de dados
  belongs_to :cliente
  has_many :matriculas
end
