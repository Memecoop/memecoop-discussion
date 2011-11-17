class Node < ActiveRecord::Base
  attr_accessible :content, :title

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

  # A node participates in many topics, through topic/node memberships.

  has_many :topic_node_memberships
  has_many :topics, :through => :topic_node_memberships

  scope :in_topic, lambda { |topic|
    joins(:topics).
    where("topics.id = ?", topic.id)
  }

  def self.treeify(nodes, choose_parent = lambda {|sources| choose_first_as_parent(sources)})
    roots = Array.new
    children = Hash.new{|h, k| h[k] = []}
    parent = Hash.new

    # For each node in the topic, select exactly one of its sources to be a parent (unless it is
    # a root node). This will ensure a tree structure, which is necessary for displaying cleanly.

    nodes.each do |n|
      parent[n] = choose_parent.call(n.sources.select {|s| nodes.include?(s)})
      if parent[n]
        children[parent[n]] << n
      end
    end

    # Populate list of roots by checking for nodes with no parent.

    nodes.each do |n|
      roots << n unless parent[n]
    end

    # Return the roots, children and parents

    tree = {
      :roots => roots,
      :children => children,
      :parent => parent
    }
  end

  private

  def self.choose_first_as_parent(sources)

    # For now, just arbitrarily pick whichever source is first in the list. This can be updated
    # later to make a more intelligent choice.

    sources.first
  end
end
