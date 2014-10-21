class CreateAlunos < ActiveRecord::Migration
  def change
    create_table :alunos do |t|
      t.integer :idcliente
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
