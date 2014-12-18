class CreateAulas < ActiveRecord::Migration
  def change
    create_table :aulas do |t|
      t.belongs_to :matricula
      t.belongs_to :horario
      t.boolean :teoria
      t.timestamps
    end
  end
end
