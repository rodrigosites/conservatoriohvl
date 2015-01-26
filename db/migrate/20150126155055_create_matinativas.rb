class CreateMatinativas < ActiveRecord::Migration
  def change
    create_table :matinativas do |t|
      t.belongs_to :aluno
      t.belongs_to :curso
      t.timestamp :data_matricula
      t.timestamp :termino_matricula
      t.integer :ano
      t.float :valor_mensal
      t.integer :teoria_ano
      t.integer :id_ativa
      t.timestamps
    end
  end
end
