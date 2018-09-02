class TeachingGroupsController < ApplicationController
  before_action :find_teaching_group, only: %i[show]

  def index
    @teaching_groups = policy_scope(current_user.teacher_teaching_groups)
    authorize @teaching_groups.first
  end

  def show
    authorize @teaching_group
  end

  private

  def find_teaching_group
    @teaching_group = TeachingGroup.find(params[:id])
  end

end

