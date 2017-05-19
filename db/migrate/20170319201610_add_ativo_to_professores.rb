class AddAtivoToProfessores < ActiveRecord::Migration
  def change
    add_column :professores, :ativo, :boolean
  end
end
