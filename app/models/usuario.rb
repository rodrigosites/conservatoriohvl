class Usuario < ActiveRecord::Base
  #associações no banco de dados
  belongs_to :acesso
end
