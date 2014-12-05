class FixMatricula < ActiveRecord::Migration
  def change
    remove_column :matriculas, :professor_id
    remove_column :matriculas, :classe_id
  end
end
