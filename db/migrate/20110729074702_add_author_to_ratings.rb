class AddAuthorToRatings < ActiveRecord::Migration
  def change
    remove_column :ratings, :writer_id, :integer
    add_column :ratings, :author_id, :integer
  end
end
