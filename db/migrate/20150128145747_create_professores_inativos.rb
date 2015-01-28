class CreateProfessoresInativos < ActiveRecord::Migration
  def change
    create_table :professores_inativos do |t|
      t.string :nome
      t.string :endereco
      t.string :rg
      t.string :cpf
      t.string :telefone
      t.string :celular
      t.string :email
      t.date   :nascimento
      t.string :bairro
      t.string :uf 
      t.string :cidade
      t.string :cep 
      t.string :pai 
      t.string :mae 
      t.string :nacionalidade 
      t.string :profissao
      t.string :escolaridade
      t.integer :id_ativo
      t.timestamps
    end
  end
end
