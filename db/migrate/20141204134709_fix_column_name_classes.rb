class FixColumnNameClasses < ActiveRecord::Migration
  def change
    rename_column :classes, :idcurso, :curso_id
  end
end
