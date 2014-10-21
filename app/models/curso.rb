class Curso < ActiveRecord::Base
  #associações no banco de dados
  has_many :matriculas
  has_and_belongs_to_many :professores
end
