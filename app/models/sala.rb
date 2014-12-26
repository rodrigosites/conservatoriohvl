class Sala < ActiveRecord::Base
  #associações no banco de dados
  has_many :horarios

  def nome=(s)
    super s.titleize
  end
end
