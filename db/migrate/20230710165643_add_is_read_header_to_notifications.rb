class AddIsReadHeaderToNotifications < ActiveRecord::Migration[7.0]
  def change
    add_column :notifications, :is_read_header, :boolean, default: false
  end
end
