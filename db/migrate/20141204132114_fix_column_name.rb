class FixColumnName < ActiveRecord::Migration
  # Migração para alterar o nome das chaves estrangeiras de acordo com o padrão do Rails.
  def change
    rename_column :alunos, :idcliente, :cliente_id
    rename_column :classes, :idprofessor, :professor_id
    rename_column :classes, :idhorario, :horario_id
    rename_column :disponibilidades, :idprofessor, :professor_id
    rename_column :horarios, :idsala, :sala_id
    rename_column :matriculas, :idaluno, :aluno_id
    rename_column :matriculas, :idclasse, :classe_id
  end
end
