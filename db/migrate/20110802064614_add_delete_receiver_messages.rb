class AddDeleteReceiverMessages < ActiveRecord::Migration
  def up
    add_column :messages, :delete_receiver, :boolean
  end

  def down
    remove_column :messages, :delete_receiver, :boolean
  end
end
