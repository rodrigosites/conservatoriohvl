class CreateHorarios < ActiveRecord::Migration
  def change
    create_table :horarios do |t|
      t.integer :idsala
      t.timestamp :horario
      t.timestamps
    end
  end
end
