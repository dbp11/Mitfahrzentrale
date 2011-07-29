class AddAttrToRating < ActiveRecord::Migration
  def change
    add_column :ratings, :writer_id, :integer
    add_column :ratings, :receiver_id, :integer
    remove_column :ratings, :written_by_id, :integer
    remove_column :ratings, :sent_to_id, :integer
  end
end
