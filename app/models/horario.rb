class Horario < ActiveRecord::Base
  #associações no banco de dados
  belongs_to :sala
  belongs_to :professor
  has_many :aulas, :dependent => :restrict_with_error
  has_many :matriculas, through: :aulas, :dependent => :destroy

  #validações de formulário
  validates :dia, :horario, presence: true
end
