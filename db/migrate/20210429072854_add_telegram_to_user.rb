class AddTelegramToUser < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :telegram_chat_id, :integer
  end
end
