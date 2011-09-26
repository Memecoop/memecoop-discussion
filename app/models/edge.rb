class Edge < ActiveRecord::Base
  belongs_to :source, :class_name => 'Node', :foreign_key => 'source_id'
  belongs_to :sink,   :class_name => 'Node', :foreign_key => 'sink_id'
end
