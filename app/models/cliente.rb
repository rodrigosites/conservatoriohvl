class Cliente < ActiveRecord::Base
  #associações no banco de dados
  has_many :alunos
end