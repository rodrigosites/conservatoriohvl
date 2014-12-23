module HorariosHelper
  def disponibilidade_salas(horario)
    salas = Sala.all
    disponiveis = []
    salas.each do |sala|
      unless sala.horarios.where(dia: horario.dia, horario: hora(horario.horario)).any?
        disponiveis << sala
      end
    end
    disponiveis
  end
end
