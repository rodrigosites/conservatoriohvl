class Matricula < ActiveRecord::Base
  #associações no banco de dados
  belongs_to :aluno
  belongs_to :curso
  has_many :aulas
  has_many :horarios, through: :aulas, :dependent => :destroy
end
