class AddUserToRequests < ActiveRecord::Migration
  def change
    add_column :requests, :user, :user
    end
end

