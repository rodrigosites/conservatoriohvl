class Matinativa < ActiveRecord::Base
  #associações no banco de dados
  belongs_to :aluno
  belongs_to :curso
end
