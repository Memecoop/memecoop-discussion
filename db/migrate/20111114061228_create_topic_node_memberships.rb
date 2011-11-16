class CreateTopicNodeMemberships < ActiveRecord::Migration
  def change
    create_table :topic_node_memberships, :id => false do |t|
      t.integer :topic_id, :null => :false
      t.integer :node_id, :null => :false
      t.timestamps
    end

    add_index :topic_node_memberships, :topic_id
    add_index :topic_node_memberships, :node_id
    add_index :topic_node_memberships, [:topic_id, :node_id], :unique => true
  end
end
