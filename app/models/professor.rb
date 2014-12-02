class Professor < ActiveRecord::Base
  #associações no banco de dados
  has_many :disponibilidades
  has_many :classes
  has_many :cursosprofessores
  has_many :cursos, through: :cursosprofessores
end
