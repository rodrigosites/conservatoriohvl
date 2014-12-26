class IncluiColunasEmProfessores < ActiveRecord::Migration
  def change
    add_column :professores, :email, :string
    add_column :professores, :nascimento, :date
    add_column :professores, :bairro, :string
    add_column :professores, :uf, :string
    add_column :professores, :cidade, :string
    add_column :professores, :cep, :string
    add_column :professores, :pai, :string
    add_column :professores, :mae, :string
    add_column :professores, :nacionalidade, :string
    add_column :professores, :profissao, :string
    add_column :professores, :escolaridade, :string
  end
end
