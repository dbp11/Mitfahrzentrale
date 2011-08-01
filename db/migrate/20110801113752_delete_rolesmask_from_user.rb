class DeleteRolesmaskFromUser < ActiveRecord::Migration
  def up
    remove_column :users, :roles_mask, :integer
  end

  def down
    add_column :users, :roles_mask, :integer
  end
end
