class Aula < ActiveRecord::Base
  belongs_to :horario
  belongs_to :matricula
end
