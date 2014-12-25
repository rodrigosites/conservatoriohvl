class AddColumnToAulas < ActiveRecord::Migration
  def change
    add_column :aulas, :musicalizacao, :boolean
  end
end
