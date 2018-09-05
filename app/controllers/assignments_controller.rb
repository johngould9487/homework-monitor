class AssignmentsController < ApplicationController
  before_action :find_assignment, only: %i[show edit update destroy set_assignment]
  before_action :find_teaching_group, only: [:show, :update, :set_assignment, :create]

  def upcoming
    if current_user.teacher
      @teaching_group = TeachingGroup.find(params[:teaching_group_id])
      @assignments = Assignment.where(teaching_group: @teaching_group).where('date_due > ?', Date.today)
      authorize(@assignments.first)
    elsif current_user.student
      @teaching_group = TeachingGroup.find(params[:teaching_group_id])
      @attempts = Attempt.all.select do |attempt|
        attempt.student == current_user && attempt.assignment.date_due > Date.today && attempt.assignment.teaching_group == @teaching_group
      end
      authorize(@attempts.first)
    else
      @child = User.find(params[:child_id])
      @attempts = Attempt.all.select do |attempt|
        attempt.student == User.find(params[:child_id]) && attempt.assignment.date_due > Date.today
      end
      authorize(@attempts.first)
    end
  end

  def past
    if current_user.teacher
      @teaching_group = TeachingGroup.find(params[:teaching_group_id])
      @assignments = Assignment.where(teaching_group: @teaching_group).where('date_due < ?', Date.today)
      authorize(@assignments.first)
    elsif current_user.student
      @teaching_group = TeachingGroup.find(params[:teaching_group_id])
      @attempts = Attempt.all.select do |attempt|
        attempt.student == current_user && attempt.assignment.date_due <= Date.today && attempt.assignment.teaching_group == @teaching_group
      end
      authorize(@attempts.first)
    else
      @child = User.find(params[:child_id])
      @attempts = Attempt.all.select do |attempt|
        attempt.student == User.find(params[:child_id]) && attempt.assignment.date_due <= Date.today
      end
      authorize(@attempts.first)
    end
  end

  def markbook
    @teaching_group = TeachingGroup.find(params[:teaching_group_id])
    @assignments = Assignment.where(teaching_group: @teaching_group)
    authorize(@assignments.first)
  end

  def show
    @child = current_user.students.first
    if current_user.student
      attempts = Attempt.all.select do |attempt|
        attempt.student == current_user && attempt.assignment == @assignment
      end
      @attempt = attempts.first
    elsif current_user.guardian
      attempts = Attempt.all.select do |attempt|
        attempt.student == @child && attempt.assignment == @assignment
      end
      @attempt = attempts.first
    end
  end

  def create
    @assignment = Assignment.new(assignment_params)
    @assignment.teaching_group = @teaching_group
    @assignment.published = params[:commit] == "Set homework"
    # @assignment.teaching_group.students.each do |student|
    #   Attempt.create(assignment: @assignment, student: student, completed: false)
    # end
    authorize @assignment
    if @assignment.save
      redirect_to teaching_group_assignment_path(teaching_group_id: @assignment.teaching_group, id: @assignment)
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
    @teaching_group = TeachingGroup.find(params[:teaching_group_id])
  end

  def update
    @assignment.published = params[:commit] == "Set homework"
    if @assignment.update(assignment_params)
      redirect_to teaching_group_assignment_path(teaching_group_id: @assignment.teaching_group, id: @assignment)
    else
      render :edit
    end
  end

  private

  def find_teaching_group
    @teaching_group = TeachingGroup.find(params[:teaching_group_id])
  end

  def find_assignment
    @assignment = Assignment.find(params[:id])
    authorize @assignment
  end

  def assignment_params
    params.require(:assignment).permit(:date_created, :date_due, :title, :description, :guardian_note, :grading_type, :maximum_score, :published)
  end
end

  # def set_assignment
  #   @assignment.published = true
  #   @assignment.save
  #   redirect_to teaching_group_assignment_path(@teaching_group, @assignment)
  # end


 # student actions
  # def index
  #   @assignments = policy_scope(Assignment).all.select do |assignment|
  #     assignment.students.include?(current_user)
  #   end
  #   authorize @assignments.first
  # end

  # def destroy
  #   @assignment.delete
  # end

  # def teacher_show
  #   @teaching_group = TeachingGroup.find(params[:id])
  #   @assignment = Assignment.find(params[:assignment_id])
  #   authorize @assignment
  # end

  # def teacher_index
  #   @teaching_group = TeachingGroup.find(params[:id])
  #   @assignments = policy_scope(Assignment).where(teaching_group_id: params[:id])
  #   authorize @assignments.first
  # end

  # # parents index
  # def parent_index
  #   @child = User.find(params[:id])
  #   @assignments = policy_scope(User).find(params[:id]).assignments
  #   authorize @assignments.first
  # end
  # def parent_show
  #   @assignment = Assignment.find(params[:assignment_id])
  # end
