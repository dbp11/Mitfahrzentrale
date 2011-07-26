class AddUserAttributes < ActiveRecord::Migration
  def self.up
    add_column :users, :user_type, :boolean
    add_column :users, :age, :integer
    add_column :users, :sex, :boolean
    add_column :users, :address, :string
    add_column :users, :zipcode, :integer
    add_column :users, :phone, :integer
    add_column :users, :instantmessenger, :string

    end   
  
  def self.down
    remove_column :users, :user_type, :boolean
    remove_column :users, :age, :integer
    remove_column :users, :sex, :boolean
    remove_column :users, :address, :string
    remove_column :users, :zipcode, :integer
    remove_column :users, :phone, :integer
    remove_column :users, :instantmessenger, :string
  end
end

