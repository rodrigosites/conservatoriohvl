class AddToMatInativas < ActiveRecord::Migration
  def change
    add_column :matinativas, :professor_id, :integer
    add_column :matinativas, :professor_teoria_id, :integer
  end
end
