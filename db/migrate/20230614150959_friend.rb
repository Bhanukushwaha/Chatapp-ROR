class Friend < ActiveRecord::Migration[7.0]
  def change
    add_column :friends, :is_sender, :boolean, default: false
  end
end
