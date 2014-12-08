class Sala < ActiveRecord::Base
  #associações no banco de dados
  has_many :horarios, :dependent => :destroy
end
