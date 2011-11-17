class RemoveCategoryFromNode < ActiveRecord::Migration
  def up
    remove_column :nodes, :category
  end

  def down
    add_column :nodes, :category, :string
  end
end
