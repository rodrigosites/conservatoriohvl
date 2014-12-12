class CreateNotificacoes < ActiveRecord::Migration
  def change
    create_table :notificacoes do |t|
      t.string :conteudo
      t.boolean :visualizado
      t.string :tipo
      t.timestamps
    end
  end
end
