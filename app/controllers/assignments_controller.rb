class AssignmentsController < ApplicationController
  before_action :find_assignment, only: %i[show edit update destroy]


  # student actions
  def index
    @assignments = policy_scope(Assignment).all.select do |assignment|
      assignment.students.include?(current_user)
    end
    authorize @assignments.first
  end

  def show
    authorize @assignment
  end

  # teacher actions
  def create
    @assignment = Assignment.new(assignment_params)
    @assignment.teaching_group = TeachingGroup.find(params[:teaching_group_id])
    authorize @assignment
      if params[:commit] == 'Save'
        @assignment.published = false
    elsif params[:commit] == 'Set'
        @assignment.published = true
    end
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
    @teaching_group = TeachingGroup.find(params[:id])
  end

  def update
    @assignment.update(assignment_params)
    redirect_to teaching_group_assignment_path
  end

  def destroy
    @assignment.delete
  end

  def teacher_show
    @teaching_group = TeachingGroup.find(params[:id])
    @assignment = Assignment.find(params[:assignment_id])
    authorize @assignment
  end

  def teacher_index
    @teaching_group = TeachingGroup.find(params[:id])
    @assignments = policy_scope(Assignment).where(teaching_group_id: params[:id])
    authorize @assignments.first
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
      :title, :description, :guardian_note, :grading_type, :maximum_score
    )
  end
end
