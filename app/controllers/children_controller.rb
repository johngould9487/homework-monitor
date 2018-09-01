class ChildrenController < ApplicationController
  def index
    @children = policy_scope(User).all.select do |user|
      user.guardians.include?(current_user)
    end
    # @children = policy_scope(current_user.students)
    authorize @children.first
  end

  def show
    @child = User.find(params[:id])
    authorize @child
  end
end
