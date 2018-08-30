class AssignmentsController < ApplicationController
  before_action :find_assignment, only: %i[show edit update destroy]


  # student actions
  def index
    @assignments = current_user.assignments
  end

  def show
  end

  # teacher actions
  def create
    @assignment = Assignment.new(assignment_params)
    @assignment.teaching_group = TeachingGroup.find(params[:teaching_group_id])
    authorize @assignment
    if @assignment.save
      redirect_to teaching_group_assignment_path(
        teaching_group_id: @assignment.teaching_group,
        id: @assignment
        )
    else
      render :new
    end
  end

  def new
    @teaching_group = TeachingGroup.find(params[:teaching_group_id])
    @assignment = Assignment.new
    authorize @assignment
  end

  def edit
  end

  def update
    @assignment.update(assignment_params)
    redirect_to teaching_group_assignment_path
  end

  def destroy
    @assignment.delete
  end

  def teacher_show
    @assignment = Assignment.find(params[:assignment_id])
    authorize @assignment
  end

  def teacher_index
    @assignments = Assignment.where(teaching_group_id: params[:id])
  end

  # parents index
  def parent_index
    @assignments = User.find(params[:id]).assignments
  end
  def parent_show
    @assignment = Assignment.find(params[:assignment_id])
  end

  private

  def find_assignment
    @assignment = Assignment.find(params[:id])
  end

  def assignment_params
    params.require(:assignment).permit(:date_created, :date_due,
      :title, :description, :grading_type, :maximum_score
    )
  end
end
