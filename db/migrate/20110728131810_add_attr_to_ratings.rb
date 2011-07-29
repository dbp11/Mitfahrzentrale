class AddAttrToRatings < ActiveRecord::Migration
  def change
    add_column :ratings, :author_id, :integer
    add_column :ratings, :receiver_id, :integer
    remove_column :ratings, :author, :integer
    remove_column :ratings, :receiver, :integer
  end
end
