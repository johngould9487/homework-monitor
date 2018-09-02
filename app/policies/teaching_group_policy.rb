class TeachingGroupPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def index?
    user.teacher
  end

  def show?
    index?
  end
end
