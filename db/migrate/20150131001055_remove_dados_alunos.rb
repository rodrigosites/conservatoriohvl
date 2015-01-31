class RemoveDadosAlunos < ActiveRecord::Migration
  def change
    remove_column :alunos, :endereco
    remove_column :alunos, :telefone
    remove_column :alunos, :email
    remove_column :alunos, :bairro
    remove_column :alunos, :uf
    remove_column :alunos, :cidade
    remove_column :alunos, :cep
    remove_column :alunos, :profissao
  end
end
