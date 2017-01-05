class AddDesdeToAlunoInativo < ActiveRecord::Migration
  def change
    add_column :alunos_inativos, :desde, :date
  end
end
