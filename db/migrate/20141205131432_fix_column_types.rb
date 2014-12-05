class FixColumnTypes < ActiveRecord::Migration
  def change
    change_column :horarios, :horario, :time
  end
end
