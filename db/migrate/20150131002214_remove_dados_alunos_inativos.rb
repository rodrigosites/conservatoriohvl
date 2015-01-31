class RemoveDadosAlunosInativos < ActiveRecord::Migration
  def change
    remove_column :alunos_inativos, :profissao
  end
end
