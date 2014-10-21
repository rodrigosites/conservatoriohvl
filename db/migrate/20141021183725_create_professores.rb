class CreateProfessores < ActiveRecord::Migration
  def change
    create_table :professores do |t|
      t.string :nome
      t.string :endereco
      t.string :rg
      t.string :cpf
      t.string :telefone
      t.string :celular
      t.timestamps
    end
  end
end
