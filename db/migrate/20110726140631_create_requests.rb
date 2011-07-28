class CreateRequests < ActiveRecord::Migration
  def change
    create_table :requests do |t|
      t.float :starts_at_N
      t.float :starts_at_E
      t.float :ends_at_N
      t.float :ends_at_E
      t.string :address_start
      t.string :address_end
      t.datetime :start_time
      t.datetime :end_time
      t.boolean :baggage
      t.string :comment

      t.timestamps 
    end
  end
end
