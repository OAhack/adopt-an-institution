class CreateAffiliations < ActiveRecord::Migration
  def up
    create_table :affiliations do |t|
      t.references :thing, :user
      t.timestamps
      t.string :type
      t.string :department
    end
    add_index :affiliations, [:thing_id, :user_id]

    add_column :things, :affiliations_count, :integer, :default => 0
    add_column :users, :affiliations_count, :integer, :default => 0

  end

  def down
  	drop_table :affiliations
    remove_column :things, :affiliations_count
    remove_column :users, :affiliations_count
  end
end
