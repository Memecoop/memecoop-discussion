class RemoveCategoryFromEdge < ActiveRecord::Migration
  def up
    remove_column :edges, :category
  end

  def down
    add_column :edges, :category, :string
  end
end
