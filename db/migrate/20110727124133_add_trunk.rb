class AddTrunk < ActiveRecord::Migration
  def up
    add_column :trips, :trunk, :string
  end

  def down
    remove_column :trips, :trunk, :string
  end
end
