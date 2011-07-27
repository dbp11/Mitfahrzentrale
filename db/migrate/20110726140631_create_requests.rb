class CreateRequests < ActiveRecord::Migration
  def change
    create_table :requests do |t|
      t.float :starts_at
      t.float :ends_at
      t.datetime :start_time
      t.datetime :end_time
      t.boolean :baggage
      t.string :comment

      t.timestamps 
    end
  end
end
