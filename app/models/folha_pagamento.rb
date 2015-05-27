class FolhaPagamento < ActiveRecord::Base
  #associações no banco de dados
  has_many :professores, :dependent => :restrict_with_error
  has_many :users, :dependent => :restrict_with_error
end
