class ChangeCarFuelConsumption < ActiveRecord::Migration
  def up
    remove_column :cars, :fuel_consumption, :integer
    add_column :cars, :price_km, :float
  end

  def down
    remove_column :cars, :price_km, :float
    add_column :cars, :fuel_consumption, :integer
  end
end
