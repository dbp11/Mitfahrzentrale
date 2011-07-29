class AddDobToUsers < ActiveRecord::Migration
  def change
    add_column :users, :birthday, :date
    remove_column :users, :age, :integer
  end
end
