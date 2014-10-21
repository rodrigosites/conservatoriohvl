class Acesso < ActiveRecord::Base
  # associações banco de dados
  has_many :usuarios
end
