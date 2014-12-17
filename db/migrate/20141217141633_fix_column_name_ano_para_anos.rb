class FixColumnNameAnoParaAnos < ActiveRecord::Migration
  def change
    rename_column :cursos, :ano, :anos
  end
end
