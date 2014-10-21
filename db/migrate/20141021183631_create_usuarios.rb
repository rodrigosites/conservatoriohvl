class CreateUsuarios < ActiveRecord::Migration
  def change
    create_table :usuarios do |t|
      t.integer :idacesso
      t.string :nome
      t.string :senha
      t.timestamps
    end
  end
end
