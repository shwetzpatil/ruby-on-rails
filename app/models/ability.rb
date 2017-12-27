class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user (not logged in)
    can :read, :all  # permissions for every user, even if not logged in    
    if user.present?  # additional permissions for logged in users (they can manage their comments)
      can :manage, User, id: user.id 
      if user.admin?  # additional permissions for administrators
        can :manage, :all
      end
    end
  end
end
