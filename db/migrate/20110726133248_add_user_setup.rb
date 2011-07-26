class AddUserSetup < ActiveRecord::Migration

  # Einstellungen für Sichtbarkeit - true = sichtbar
  def up
    add_column :users, :email_notifications, :boolean
    add_column :users, :visible_phone, :boolean
    add_column :users, :visible_email, :boolean
    add_column :users, :visible_address,:boolean
    add_column :users, :visible_age, :boolean
    add_column :users, :visible_im, :boolean 
    add_column :users, :visible_cars, :boolean
  end

  def down
    remove_column :users, :email_notifications, :boolean
    remove_column :users, :visible_phone, :boolean
    remove_column :users, :visible_email, :boolean
    remove_column :users, :visible_address,:boolean
    remove_column :users, :visible_age, :boolean
    remove_column :users, :visible_im, :boolean
    remove_column :users, :visible_cars, :boolean

  end
end
