class AddDeleteWriterMessages < ActiveRecord::Migration
  def up
   add_column :messages, :delete_writer, :boolean 
  end

  def down
    remove_column :messages, :delete_writer, :boolean
  end
end
