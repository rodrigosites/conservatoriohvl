class AddColumnUserIdToNotificacoes < ActiveRecord::Migration
  def change
    add_column :notificacoes, :user_id, :integer
  end
end
