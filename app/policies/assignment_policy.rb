class AssignmentPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def create?
    user.teacher
  end

  def teacher_show?
    user.teacher
  end

  def teacher_index?
    user.teacher
  end
end
