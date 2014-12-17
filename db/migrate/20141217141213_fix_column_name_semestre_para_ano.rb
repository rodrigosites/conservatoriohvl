class FixColumnNameSemestreParaAno < ActiveRecord::Migration
  def change
    rename_column :cursos, :semestres, :ano
    rename_column :matriculas, :semestre, :ano
  end
end
