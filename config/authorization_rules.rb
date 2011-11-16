authorization do
  role :admin do
    includes :moderator
    has_permission_on [:users], :to => :manage
  end

  role :moderator do
    includes :user
    has_permission_on [:nodes, :edges, :ratings, :topics], :to => :manage
  end

  role :user do
    has_permission_on :topics, :to => [:read, :create]
    has_permission_on :nodes, :to => [:show, :create]
    has_permission_on :nodes, :to => :update do
      if_attribute :creator => is {user}
    end
    has_permission_on :users, :to => :update do
      if_attribute :id => is {user.id}
    end
    has_permission_on :ratings, :to => :create
  end

  role :guest do
    has_permission_on :nodes, :to => :show
    has_permission_on :topics, :to => :read
    has_permission_on :users, :to => :create
  end
end

privileges do
  privilege :manage, :includes => [:create, :read, :update, :delete]
  privilege :read, :includes => [:index, :show]
  privilege :create, :includes => :new
  privilege :update, :includes => :edit
  privilege :delete, :includes => :destroy
end