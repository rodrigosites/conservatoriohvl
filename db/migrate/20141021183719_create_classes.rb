class CreateClasses < ActiveRecord::Migration
  def change
    create_table :classes do |t|
      t.integer :idprofessor
      t.integer :idhorario
      t.float :salario_professor
      t.timestamps
    end
  end
end
