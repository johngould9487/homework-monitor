class ChildrenController < ApplicationController
  def index
      @children = current_user.students
  end

  def show
      @child = User.find(params[:id])

    end
    # def show
    # newsletter placeholder
    # end
   end
