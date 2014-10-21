class CreateCursos < ActiveRecord::Migration
  def change
    create_table :cursos do |t|
      t.string :nome
      t.float :valor
      t.integer :semestres
      t.timestamps
    end
  end
end
