class TopicNodeMembership < ActiveRecord::Base
  belongs_to :topic
  belongs_to :node
end
