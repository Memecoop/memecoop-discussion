class Node < ActiveRecord::Base
  attr_accessible :content, :title, :category

  # "Sinks" refers to nodes at the end of edges going out from this Node.

  has_many :sink_edges, :class_name => 'Edge', :foreign_key => 'source_id', :dependent => :destroy
  has_many :sinks, :through => :sink_edges

  # "Sources" refers to nodes at the beginning of edges coming into this Node.

  has_many :source_edges, :class_name => 'Edge', :foreign_key => 'sink_id', :dependent => :destroy
  has_many :sources, :through => :source_edges

  # A node has exactly one creator.

  belongs_to :creator, :class_name => 'User', :foreign_key => 'creator_id'

  # A node has many ratings.

  has_many :ratings
end
