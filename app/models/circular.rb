class Circular < ActiveRecord::Base
  #validações
  validates :numero_circular, uniqueness: true
  validates :numero_circular, :data_circular, :desconto, :valor_mensalidade, :valor_extra, 
  :taxa_matricula, presence: true

  def self.search(search, page)
    paginate :per_page => 10, :page => page, :order => 'created_at DESC',
             :conditions => ['numero_circular like ?', "%#{search}%"]
  end
end
