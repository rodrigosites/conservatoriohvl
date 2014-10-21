class CreateAcessos < ActiveRecord::Migration
  def change
    create_table :acessos do |t|
      t.string :nivel
      t.timestamps
    end
  end
end
