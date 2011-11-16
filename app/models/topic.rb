class Topic < ActiveRecord::Base
  attr_accessible :title, :description
  attr_accessor :roots, :children

  # A topic has exactly one creator.

  belongs_to :creator, :class_name => 'User', :foreign_key => 'creator_id'

  # A topic contains many nodes, through topic/node memberships.

  has_many :topic_node_memberships
  has_many :nodes, :through => :topic_node_memberships
end
