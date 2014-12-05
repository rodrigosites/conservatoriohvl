class AddColumnCursoIdToMatriculas < ActiveRecord::Migration
  def change
    add_column :matriculas, :curso_id, :integer
  end
end
