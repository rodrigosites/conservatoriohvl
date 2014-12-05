class Horario < ActiveRecord::Base
  #associações no banco de dados
  belongs_to :sala
  belongs_to :professor
  has_many :matriculas

  #validações de formulário
  validates :horario, presence: true
end
