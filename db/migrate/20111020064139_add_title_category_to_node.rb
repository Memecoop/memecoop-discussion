class AddTitleCategoryToNode < ActiveRecord::Migration
  def change
    add_column :nodes, :title, :string
    add_column :nodes, :category, :string
  end
end
