class TeachingGroupsController < ApplicationController
  before_action :find_assignment, only: %i[show]

  def index
    @teaching_groups = current_user.teacher_teaching_groups
  end

  def show
  end

  private

  def find_teaching_group
    @teaching_group = TeachingGroup.find(params[:id])
  end

end

