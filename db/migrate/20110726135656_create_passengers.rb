class CreatePassengers < ActiveRecord::Migration
  def change
    create_table :passengers do |t|
      t.references :user
      t.references :trip
      t.boolean :confirmed

      t.timestamps
    end
    add_index :passengers, :user_id
    add_index :passengers, :trip_id
  end
end
