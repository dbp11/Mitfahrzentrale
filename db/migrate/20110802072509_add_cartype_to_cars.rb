class AddCartypeToCars < ActiveRecord::Migration
  def up
    add_column :cars, :car_type, :text
  end
  def down
    remove_column :cars, :car_type, :text
  end
end
