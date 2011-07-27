class CreateRatings < ActiveRecord::Migration
  def change
    create_table :ratings do |t|
      t.string :comment
      t.integer :mark
      t.integer :written_by_id
      t.integer :sent_to_id
      t.references :trip

      t.timestamps
    end
    add_index :ratings, :trip_id
  end
end
