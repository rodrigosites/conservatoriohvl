class IncluiColunasEmAlunos < ActiveRecord::Migration
  def change
    add_column :alunos, :email, :string
    add_column :alunos, :nascimento, :date
    add_column :alunos, :bairro, :string
    add_column :alunos, :uf, :string
    add_column :alunos, :cidade, :string
    add_column :alunos, :cep, :string
    add_column :alunos, :pai, :string
    add_column :alunos, :mae, :string
    add_column :alunos, :nacionalidade, :string
    add_column :alunos, :profissao, :string
  end
end
