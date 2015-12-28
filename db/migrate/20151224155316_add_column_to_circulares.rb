class AddColumnToCirculares < ActiveRecord::Migration
  def change
    add_column :circulares, :valor_profissionalizante, :float
    remove_column :cursos, :valor
    add_column :cursos, :basico, :boolean
  end
end
