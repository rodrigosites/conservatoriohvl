class Curso < ActiveRecord::Base
  #associações no banco de dados
  has_many :matriculas
  has_many :cursosprofessores
  has_many :professores, through: :cursosprofessores
end
