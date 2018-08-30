class AttemptPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def teacher_index?
    user.teacher
  end
end
