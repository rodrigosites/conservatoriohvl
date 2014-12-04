class Curso < ActiveRecord::Base
  #associações no banco de dados
  has_many :classes
  has_many :lecionam
  has_many :professores, through: :lecionam
end
