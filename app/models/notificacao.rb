class Notificacao < ActiveRecord::Base
  belongs_to :user

  def self.search(search, page, usuario)
    paginate :per_page => 15, :page => page, :order => 'created_at',
             :conditions => ['tipo LIKE ? OR conteudo LIKE ? AND user_id = ?', "%#{search}%", "%#{search}%", usuario]
  end
end
