class AddIndexToCursosProfessores < ActiveRecord::Migration
  def change
    add_index :cursos_professores, :professor_id
    add_index :cursos_professores, :curso_id
  end
end
