class AddAtivoToAlunos < ActiveRecord::Migration
  def change
    add_column :alunos, :ativo, :boolean
    add_column :clientes, :ativo, :boolean
  end
end
