class SimplificarDbSchema < ActiveRecord::Migration
  def change
    add_column :horarios, :professor_id, :integer
    add_column :matriculas, :professor_id, :integer
  end
end
