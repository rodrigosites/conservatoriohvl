class AddColumnTeoriaAnoToMatriculas < ActiveRecord::Migration
  def change
    add_column :matriculas, :teoria_ano, :integer
  end
end
