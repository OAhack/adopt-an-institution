class CleanupUsersAndThings < ActiveRecord::Migration
  def up
    remove_column :users, :organization
    remove_column :users, :voice_number
    remove_column :users, :sms_number
    remove_column :users, :address_1
    remove_column :users, :address_2
    remove_column :users, :city
    remove_column :users, :state
    remove_column :users, :zip

    remove_column :things, :city_id
    remove_column :things, :user_id
  end

  def down
  	add_column :users, :organization, :string
  	add_column :users, :voice_number, :string
  	add_column :users, :sms_number, :string
    add_column :users, :address_1, :string
    add_column :users, :address_2, :string
    add_column :users, :city, :string
    add_column :users, :state, :string
    add_column :users, :zip, :string
  end
end
