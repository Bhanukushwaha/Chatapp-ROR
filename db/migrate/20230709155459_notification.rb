class Notification < ActiveRecord::Migration[7.0]
  def change
    add_column :notifications, :message_id, :bigint
  end
end
