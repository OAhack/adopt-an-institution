class AddManytomanyThingsAndUsers < ActiveRecord::Migration
  def up
    create_table :things_users do |t|
      t.references :thing, :user
    end
    
    add_index :things_users, [:thing_id, :user_id]
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
