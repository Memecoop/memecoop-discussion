class RenameEdgeTypeToCategory < ActiveRecord::Migration
  def change
    rename_column :edges, :type, :category
  end
end
