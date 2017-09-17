class Aluno < ActiveRecord::Base
  #associações no banco de dados
  belongs_to :cliente
  has_many :matriculas
  has_many :matinativas

  #validações
  validates :cliente_id, :nome, :celular, :nascimento, :pai, :mae, :nacionalidade, presence: true

  def nome=(s)
    super s.titleize
  end

  def endereco=(s)
    super s.titleize
  end
  
  def bairro=(s)
    super s.titleize
  end

  def cidade=(s)
    super s.titleize
  end

  def uf=(s)
    super s.upcase
  end

  def pai=(s)
    super s.titleize
  end

  def mae=(s)
    super s.titleize
  end

  def nacionalidade=(s)
    super s.titleize
  end

  def profissao=(s)
    super s.titleize
  end

  def self.search(search, page, ativo)
    paginate :per_page => 10, :page => page, :order => 'nome',
             :conditions => ['nome like ? and ativo = ?', "%#{search}%", ativo]
  end

end
