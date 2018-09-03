class UserPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def index?
    user.guardian
  end

  def show?
    index?
  end
end
