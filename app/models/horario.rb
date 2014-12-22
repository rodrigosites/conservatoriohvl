class Horario < ActiveRecord::Base
  #associações no banco de dados
  belongs_to :sala
  belongs_to :professor
  has_many :aulas, :dependent => :destroy
  has_many :matriculas, through: :aulas, :dependent => :destroy

  #validações de formulário
  validates :horario, presence: true
end
