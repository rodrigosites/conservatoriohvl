class FixColumnTypes < ActiveRecord::Migration
  def change
    change_column :disponibilidades, :horario, :time
    change_column :horarios, :horario, :time
  end
end
