class Matinativa < ActiveRecord::Base
  #associações no banco de dados
  belongs_to :aluno
  belongs_to :curso

  def self.search(search, page)
    paginate :per_page => 10, :page => page,
             :joins => :aluno,
             :conditions => ['nome like ?', "%#{search}%"]
  end
end
