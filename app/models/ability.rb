class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user (not logged in)
    can :read, [Product, Comment]  # permissions for every user, even if not logged in    
    if user.id?  # additional permissions for logged in users (they can manage their comments)
      can :manage, User, id: user.id
      can [:create, :delete, :update, :destroy], Comment, user_id: user.id
      cannot :crud, Product
      
      if user.admin?  # additional permissions for administrators
        can :manage, :all
      end
    end
  end
end
