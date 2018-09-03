class ChildrenController < ApplicationController
  def index

    @children = User.all.select do |user|
      user.guardians.include?(current_user)
    end
    authorize @children.first
  end

  # def show
  #   @child = User.find(params[:id])
  #   authorize @child
  # end
end
