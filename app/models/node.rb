class Node < ActiveRecord::Base
  has_many :sink_edges, :class_name => 'Edge', :foreign_key => 'source_id'
  has_many :sinks, :through => :sink_edges

  has_many :source_edges, :class_name => 'Edge', :foreign_key => 'sink_id'
  has_many :sources, :through => :source_edges
end
