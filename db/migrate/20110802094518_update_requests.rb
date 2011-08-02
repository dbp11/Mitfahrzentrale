class UpdateRequests < ActiveRecord::Migration
  def up
    add_column :requests, :duration, :integer
    add_column :requests, :distance, :integer
    add_column :requests, :start_radius, :integer
    add_column :requests, :end_radius, :integer
  end
  def down
    remove_column :requests, :duration, :integer
    remove_column :requests, :distance, :integer
    remove_column :requests, :start_radius, :integer
    remove_column :requests, :end_radius, :integer
  end
end
