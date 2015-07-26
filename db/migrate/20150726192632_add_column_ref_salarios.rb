class AddColumnRefSalarios < ActiveRecord::Migration
  def change
    add_column :circulares, :salario_aula, :float
    add_column :professores, :valor_aula, :float
  end
end
