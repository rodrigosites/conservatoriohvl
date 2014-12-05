class Matricula < ActiveRecord::Base
  #associações no banco de dados
  belongs_to :aluno
  belongs_to :curso
  belongs_to :horario

end
