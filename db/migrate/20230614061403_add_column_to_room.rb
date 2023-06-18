class AddColumnToRoom < ActiveRecord::Migration[7.0]
  def change
    add_column :rooms, :sender_id, :integer
    add_column :rooms, :receiver_id, :integer
  end
end
