class Curso < ActiveRecord::Base
  #associações no banco de dados
  has_many :lecionam
  has_many :matriculas, :dependent => :destroy
  has_many :professores, through: :lecionam

  #validações
  validates :nome, uniqueness: true
  validates :nome, :valor, :anos, presence: true

  def nome=(s)
    super s.titleize
  end
end
