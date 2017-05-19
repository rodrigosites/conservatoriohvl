class AddToMatInativas2 < ActiveRecord::Migration
  def change
    add_column :matinativas, :dia_pratica, :integer
    add_column :matinativas, :dia_teoria, :integer
  end
end
