class ChangeUserAttributes < ActiveRecord::Migration
  def up
    remove_column :users, :picture_file_name, :string
    remove_column :users, :picture_content_type, :string
    remove_column :users, :picture_file_size, :integer
    remove_column :users, :picture_updated_at, :datetime
    add_column :users, :pic_file_name, :string
    add_column :users, :pic_content_type, :string
    add_column :users, :pic_file_size, :integer
    add_column :users, :pic_updated_at , :datetime
  end

  def down
    add_column :users, :picture_file_name, :string
    add_column :users, :picture_content_type, :string
    add_column :users, :picture_file_size, :integer
    add_column :users, :picture_updated_at, :datetime
    remove_column :users, :pic_file_name, :string
    remove_column :users, :pic_content_type, :string
    remove_column :users, :pic_file_size, :integer
    remove_column :users, :pic_updated_at , :datetime
  end
end
