class CreateTrips < ActiveRecord::Migration
  def change
    create_table :trips do |t|
      t.references :user
      t.references :car
      t.float :starts_at_N
      t.float :starts_at_E
      t.float :ends_at_E
      t.float :ends_at_N
      t.string :address_start
      t.string :address_end
      t.datetime :start_time
      t.datetime :end_time
      t.integer :baggage
      t.text :comment

      t.timestamps
    end
    add_index :trips, :user_id
    add_index :trips, :car_id
  end
end
