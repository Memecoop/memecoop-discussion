authorization do
  role :admin do
    has_permission_on [:users, :nodes, :edges], :to => :manage
  end

  role :moderator do
    includes :user
    has_permission_on [:nodes, :edges], :to => :manage
  end

  role :user do
    has_permission_on :nodes, :to => [:read, :create]
    has_permission_on :nodes, :to => :manage do
      if_attribute :creator => is {user}
    end
  end

  role :guest do
    has_permission_on :nodes, :to => [:read, :create]
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