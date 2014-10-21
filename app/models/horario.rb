class Horario < ActiveRecord::Base
  #associações no banco de dados
  belongs_to :sala
  has_one :classe
end
