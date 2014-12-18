class CreateMatriculas < ActiveRecord::Migration
  def change
    create_table :matriculas do |t|
      t.belongs_to :aluno
      t.belongs_to :curso
      t.timestamp :data_matricula
      t.timestamp :termino_matricula
      t.integer :ano
      t.float :valor_mensal
      t.timestamps
    end
  end
end
