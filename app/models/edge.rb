class Edge < ActiveRecord::Base
  attr_accessible :source_id, :sink_id, :category

  belongs_to :source, :class_name => 'Node', :foreign_key => 'source_id'
  belongs_to :sink,   :class_name => 'Node', :foreign_key => 'sink_id'

  before_destroy :destroy_callback

  def destroy_callback
    # TODO: If deleting this edge will "orphan" a node, handle it intelligently (delete the node?).
    true
  end
end
