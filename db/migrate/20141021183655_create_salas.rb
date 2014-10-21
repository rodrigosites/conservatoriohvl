class CreateSalas < ActiveRecord::Migration
  def change
    create_table :salas do |t|
      t.string :nome
      t.timestamps
    end
  end
end
