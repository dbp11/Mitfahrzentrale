class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.text :message
      t.references :writer
      t.references :receiver

      t.timestamps
    end
    add_index :messages, :writer_id
    add_index :messages, :receiver_id
  end
end
