class AddColumnIdcursoToClasses < ActiveRecord::Migration
  def change
    add_column :classes, :idcurso, :integer
  end
end
