class AddDesdeToAluno < ActiveRecord::Migration
  def change
    add_column :alunos, :desde, :date
  end
end
