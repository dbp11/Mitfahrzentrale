class AddBusinessToUsers < ActiveRecord::Migration
  def up
    add_column :users, :business, :boolean
  end
  def down
    remove_column :users, :business, :boolean
  end
end
