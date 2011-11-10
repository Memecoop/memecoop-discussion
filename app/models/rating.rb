class Rating < ActiveRecord::Base
  attr_accessible :node_id, :user_id, :key, :value

  belongs_to :user
  belongs_to :node
end
