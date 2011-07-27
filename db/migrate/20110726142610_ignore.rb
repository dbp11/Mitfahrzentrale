class Ignore < ActiveRecord::Migration
  def up
    create_table :ignore, :id => false do |t|
      t.integer :ignoring_id
      t.integer :ignored_id
    end
  end
  def down
    drop_table :ignore
  end
end
