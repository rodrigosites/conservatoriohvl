class Aluno < ActiveRecord::Base
  #associações no banco de dados
  belongs_to :cliente
  has_many :matriculas, :dependent => :destroy

  #validações
  validates :cpf,:rg, uniqueness: true
  validates :cliente_id, :nome, :endereco, :rg, :cpf, :telefone, :celular, :email, :nascimento, :bairro, :cidade, :uf,
  :cep, :pai, :mae, :nacionalidade, :profissao, presence: true

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

  def self.search(search, page)
    paginate :per_page => 10, :page => page,
             :conditions => ['nome like ?', "%#{search}%"]
  end
end
