class DropPhoneFromUsers < ActiveRecord::Migration
  def up
    remove_column :users, :phone, :integer
    add_column :users, :phone, :string
  end

  def down
    remove_column :users, :phone, :string
    add_column :users, :phone, :integer
  end
end
