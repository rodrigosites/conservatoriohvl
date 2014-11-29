class AddColumnDiaToHorarios < ActiveRecord::Migration
  def change
    add_column :horarios, :dia, :string
  end
end
