class CreateDisponibilidades < ActiveRecord::Migration
  def change
    create_table :disponibilidades do |t|
      t.integer :idprofessor
      t.timestamp :horario
      t.timestamps
    end
  end
end
