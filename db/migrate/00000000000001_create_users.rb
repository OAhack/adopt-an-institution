class CreateUsers < ActiveRecord::Migration
  def up
    create_table :users do |t|
      t.timestamps
      t.string :name, :null => false
      t.string :email, :null => false
      t.boolean :admin, :default => false
      t.database_authenticatable :null => false
      t.recoverable
      t.rememberable
      t.trackable
      t.datetime :reset_password_sent_at

    end

    add_index :users, :email, :unique => true
    add_index :users, :reset_password_token, :unique => true
  end

  def down
    drop_table :users
  end
end
