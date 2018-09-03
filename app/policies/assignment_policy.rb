class AssignmentPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def new?
    user.teacher
  end

  def create?
    user.teacher
  end

  def upcoming?
    true
  end

  def show?
    true
  end

  def upcoming?
    true
  end

  def past?
    true
  end

  def markbook?
    user.teacher
  end

  def edit?
    user.teacher
  end

  def update?
    edit?
  end

  ############################################################

  # def index?
  #   user.student
  # end

  # def teacher_show?
  #   user.teacher
  # end

  # def teacher_index?
  #   user.teacher
  # end

  # def parent_index?
  #   user.guardian
  # end
end
