class Dropusertable < ActiveRecord::Migration[7.0]
  def up
    drop_table :users
  end
  def down
  end
end
