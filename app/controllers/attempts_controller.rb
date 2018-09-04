class AttemptsController < ApplicationController
  def update
    @attempt = Attempt.find(params[:id])
    authorize @attempt
    if @attempt.update(attempt_params)
      redirect_to teaching_group_markbook_path(teaching_group_id: @attempt.assignment.teaching_group)
    else
      render 'assignments/markbook'
    end
  end

  private

  def attempt_params
    params.require(:attempt).permit(:mark, :comment)
  end
end




# class AttemptsController < ApplicationController
#   before_action :find_attempt_teacher, only: %i[teacher_show teacher_edit teacher_update]
#   before_action :find_attempt_student, only: %i[show edit update]
#   # teacher actions
#   def teacher_index
#     @attempts = policy_scope(Assignment.find(params[:id]).attempts)
#     @teaching_group = TeachingGroup.find(params[:teaching_group_id])
#     authorize @attempts.first
#   end

#   def teacher_show
#     authorize @attempt
#   end

#   def teacher_edit
#   end

#   def teacher_update
#     @attempt.update(attempts_params_teacher)
#   end

#   # student actions
#   def index
#     @attempts = Attempts.where(assignment_id: params[:id])
#   end

#   def show
#   end

#   def edit
#   end

#   def update
#     @attempt.update(attempts_params_student)
#   end

#   private

#   def find_attempt_teacher
#     @attempt = Attempt.find(params[:attempts_id])
#   end

#   def find_attempt_student
#     @attempt = Attempt.find(params[:id])
#   end

#   def attempt_params_teacher
#     params.require(:attempt).permit(:completed, :mark, :comment)
#   end

#   def attempt_params_student
#     # params.require(:attempt).permit(:completed, :mark, :comment)
#     # need to make sure and decide what student can edit!!!
#   end
# end









