class ExcluiTerminoMatricula < ActiveRecord::Migration
  def change
    remove_column :matriculas, :termino_matricula
  end
end
