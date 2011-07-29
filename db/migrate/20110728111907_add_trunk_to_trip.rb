class AddTrunkToTrip < ActiveRecord::Migration
  def self.up 
    remove_column :trips, :trunk, :string
    remove_column :trips, :baggage, :integer
    add_column :trips, :baggage, :boolean
  end
  def  self.down
    remove_column :trips, :baggage, :boolean
    add_column :trips, :trunk, :string
    add_column :trips, :baggage, :integer
  end
end
