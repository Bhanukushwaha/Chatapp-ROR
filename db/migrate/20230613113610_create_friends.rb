class CreateFriends < ActiveRecord::Migration[7.0]
  def change
    create_table :friends do |t|
      t.integer :sender_id
      t.integer :receiver_id
      t.boolean :is_accept, default: false
      t.timestamps
    end
  end
end
