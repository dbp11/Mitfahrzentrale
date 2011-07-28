class AddTrunkToTrip < ActiveRecord::Migration
  def change
    remove_column :trips, :trunk, :string
    remove_column :trips, :baggage, :integer
    add_column :trips, :baggage, :boolean
  end
end
