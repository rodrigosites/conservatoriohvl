class Professor < ActiveRecord::Base
  #associações no banco de dados
  has_many :disponibilidades
  has_many :classes
  has_and_belongs_to_many :cursos
end
