class ProfessoresInativo < ActiveRecord::Base
  def self.search(search, page)
    paginate :per_page => 10, :page => page, :order => 'nome',
             :conditions => ['nome like ?', "%#{search}%"]
  end
end
