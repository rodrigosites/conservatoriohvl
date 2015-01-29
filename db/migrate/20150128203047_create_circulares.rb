class CreateCirculares < ActiveRecord::Migration
  def change
    create_table :circulares do |t|
      t.string :numero_circular
      t.date :data_circular
      t.float :desconto
      t.float :valor_mensalidade
      t.float :valor_extra
      t.boolean :vigente
      t.timestamps
    end
  end
end
