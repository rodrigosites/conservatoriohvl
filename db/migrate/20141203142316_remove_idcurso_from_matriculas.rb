class RemoveIdcursoFromMatriculas < ActiveRecord::Migration
  def change
    remove_column :matriculas, :idcurso, :integer
  end
end
