class AddAffiliations < ActiveRecord::Migration
  def up
    create_table :affiliations do |t|
      t.references :thing, :user
      t.timestamps
      t.string :type
      t.string :department
    end
	add_index :affiliations, [:thing_id, :user_id]
  end

  def down
  	drop_table :affiliations
  end
end
