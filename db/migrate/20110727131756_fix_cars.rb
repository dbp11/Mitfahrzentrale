class FixCars < ActiveRecord::Migration
  def up
    remove_column :cars, :type, :string
    add_column :cars, :description, :string
  end

  def down
    add_column :cars, :type, :string
    remove_column :cars, :description, :string
  end
end
