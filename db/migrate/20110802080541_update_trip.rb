class UpdateTrip < ActiveRecord::Migration
  def up
    add_column :trips, :distance, :integer
    add_column :trips, :duration, :integer
  end

  def down
    remove_column :trips, :distance, :integer
    remove_column :trips, :duration, :integer
  end
end
