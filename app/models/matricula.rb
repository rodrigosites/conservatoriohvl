class Matricula < ActiveRecord::Base
  #associações no banco de dados
  belongs_to :aluno
  belongs_to :curso
  has_many :aulas, :dependent => :destroy
  has_many :horarios, through: :aulas, :dependent => :destroy

  #acessa o <text> :horario_id e possibilita validação abaixo
  attr_accessor :horario_id
  
  #validações
  validates :aluno_id, :curso_id, :ano, :valor_mensal, :horario_id, presence: true
end
