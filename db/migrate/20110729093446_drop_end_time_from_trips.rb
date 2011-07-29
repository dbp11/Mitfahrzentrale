class DropEndTimeFromTrips < ActiveRecord::Migration
  def up
    remove_column :trips, :end_time, :datetime
  end

  def down
    add_column :trips, :end_time, :datetime
  end
end
