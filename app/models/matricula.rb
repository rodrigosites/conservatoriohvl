class Matricula < ActiveRecord::Base
  #associações no banco de dados
  belongs_to :aluno
  belongs_to :curso
  has_many :aulas, :dependent => :destroy
  has_many :horarios, through: :aulas, :dependent => :destroy

  #validações
  validates :aluno_id, :curso_id, :ano, :valor_mensal, presence: true

  def self.search(search, page)
    paginate :per_page => 10, :page => page,
             :joins => :aluno,
             :conditions => ['nome like ?', "%#{search}%"]
  end
end
