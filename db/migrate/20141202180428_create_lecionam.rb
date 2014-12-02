class CreateLecionam < ActiveRecord::Migration
  def change
    create_table :lecionam do |t|
      t.belongs_to :curso
      t.belongs_to :professor
      t.timestamps
    end
  end
end
