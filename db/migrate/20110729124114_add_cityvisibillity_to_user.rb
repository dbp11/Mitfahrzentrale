class AddCityvisibillityToUser < ActiveRecord::Migration
  def up
    add_column :users, :visible_city, :boolean
  end
  def down
    remove_column :users, :visible_zip, :boolean
  end
end
