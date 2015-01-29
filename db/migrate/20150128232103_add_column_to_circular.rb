class AddColumnToCircular < ActiveRecord::Migration
  def change
    add_column :circulares, :taxa_matricula, :float
  end
end
