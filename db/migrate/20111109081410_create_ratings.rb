class CreateRatings < ActiveRecord::Migration
  def change
    create_table :ratings do |t|
      t.integer :node_id
      t.integer :user_id
      t.string :key
      t.integer :value

      t.timestamps
    end
    add_index :ratings, :node_id
    add_index :ratings, [:node_id, :user_id, :key], :unique => true
  end
end
