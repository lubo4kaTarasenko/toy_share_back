class CreateNotifications < ActiveRecord::Migration[6.1]
  def change
    create_table :notifications do |t|
      t.text :body
      t.string :kind
      t.string :status

      t.timestamps
    end
  end
end
