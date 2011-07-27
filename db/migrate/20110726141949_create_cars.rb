class CreateCars < ActiveRecord::Migration
  def change
    create_table :cars do |t|
      t.references :user
      t.integer :seats
      t.string :trunk
      t.string :type
      t.string :licence
      t.float :fuel_consumption
      t.boolean :smoker

      t.timestamps
    end
    add_index :cars, :user_id
  end
end
