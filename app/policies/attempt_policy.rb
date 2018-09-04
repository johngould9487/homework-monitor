class AttemptPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def update?
    user.teacher
  end

  def upcoming?
    true
  end

  def past?
    true
  end

  # def teacher_index?
  #   user.teacher
  # end

  # def teacher_show?
  #   user.teacher
  # end
end
