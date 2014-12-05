class AddColumnHorarioIdToMatriculas < ActiveRecord::Migration
  def change
    add_column :matriculas, :horario_id, :integer
  end
end
