class CreateThings < ActiveRecord::Migration
  def change
    create_table :things do |t|
      t.timestamps
      t.string :name
      t.decimal :lat, :null => false, :precision => 16, :scale => 14
      t.decimal :lng, :null => false, :precision => 17, :scale => 14
    end

    add_index :things, :city_id, :unique => true
  end
end
