class AddCreatorToNodes < ActiveRecord::Migration
  def change
    add_column :nodes, :creator_id, :integer
  end
end
