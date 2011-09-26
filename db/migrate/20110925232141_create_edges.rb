class CreateEdges < ActiveRecord::Migration
  def change
    create_table :edges do |t|
      t.string :type
      t.integer :source_id
      t.integer :sink_id

      t.timestamps
    end

    add_index :edges, :source_id
    add_index :edges, :sink_id
    add_index :edges, [:source_id, :sink_id], :unique => true
  end
end
