class User < ActiveRecord::Base
  authenticates_with_sorcery!

  validates :password, length: { minimum: 3 }
  validates :password, confirmation: true
  validates :password_confirmation, presence: true
  validates :nivel, presence: true

  validates :username, uniqueness: true

  has_many :notificacoes, :dependent => :destroy
end
