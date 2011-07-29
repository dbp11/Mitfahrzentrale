class AddFreeseatsToTrips < ActiveRecord::Migration
  def up
    add_column :trips, :free_seats, :integer
  end
  def down
    remove_column :trips, :free_seats, :integer
  end

end
