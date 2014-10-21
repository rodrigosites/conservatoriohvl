class CreateMatriculas < ActiveRecord::Migration
  def change
    create_table :matriculas do |t|
      t.integer :idaluno
      t.integer :idcurso
      t.integer :idclasse
      t.timestamp :data_matricula
      t.timestamp :termino_matricula
      t.integer :semestre
      t.float :valor_mensal
      t.timestamps
    end
  end
end
