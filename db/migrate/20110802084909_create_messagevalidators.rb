class CreateMessagevalidators < ActiveRecord::Migration
  def change
    create_table :messagevalidators do |t|

      t.timestamps
    end
  end
end
