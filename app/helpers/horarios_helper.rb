module HorariosHelper
  def disponibilidade_salas(horario)
    salas = Sala.all
    disponiveis = []
    salas.each do |sala|
      unless sala.horarios.where(dia: horario.dia, horario: horario.horario.to_s.slice(10..15)).any?
        disponiveis << sala
      end
    end
    disponiveis
  end
end
