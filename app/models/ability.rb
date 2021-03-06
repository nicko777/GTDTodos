class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user

    if user.role? :admin
      can :manage, :all
      can :see_timestamps, User
    elsif user.role? :paid_user
      can :manage, Project do |project|
        project.try(:user) == user
      end
      can :manage, Todo do |todo|
        todo.try(:user) == user
      end
      can :see_timestamps, User, :id => user.id
    elsif user.role? :free_user
      can :manage, Project do |project|
        project.try(:user) == user
      end
      can :manage, Todo do |todo|
        todo.try(:user) == user
      end
      can :see_timestamps, User, :id => user.id
    end
  end
end

