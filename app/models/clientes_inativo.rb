class ClientesInativo < ActiveRecord::Base
  def self.search(search, page)
    paginate :per_page => 10, :page => page,
             :conditions => ['nome like ?', "%#{search}%"]
  end
end
