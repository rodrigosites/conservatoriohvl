class CreateHorarios < ActiveRecord::Migration
  def change
    create_table :horarios do |t|
      t.belongs_to :professor
      t.belongs_to :sala
      t.string :dia
      t.time :horario
      t.timestamps
    end
  end
end
