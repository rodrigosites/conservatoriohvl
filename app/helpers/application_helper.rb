module ApplicationHelper
  def dia(string)
    string.slice(2,string.length-1)
  end

  def hora(horario)
    horario.to_s.slice(10..15)
  end

  def data(data)
    data.strftime('%d/%m/%Y')
  end

  def por_pagina
    return 12
  end
end
