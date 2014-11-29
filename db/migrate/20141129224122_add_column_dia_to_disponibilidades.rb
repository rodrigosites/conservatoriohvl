class AddColumnDiaToDisponibilidades < ActiveRecord::Migration
  def change
    add_column :disponibilidades, :dia, :string
  end
end
