class Classe < ActiveRecord::Base
  #associações no banco de dados
  has_many :matriculas
  belongs_to :horario
  belongs_to :professor
  belongs_to :curso
end
