class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!
  include Pundit

  after_action :verify_authorized, unless: :skip_pundit?
  # after_action :verify_policy_scoped, only: [ :index, :teacher_index ], unless: :skip_pundit?

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  def user_not_authorized
    flash[:alert] = "You are not authorized to perform this action."
    redirect_to(root_path)
  end

  def default_url_options
    { host: ENV["HOST"] || "localhost:3000" }
  end

  def after_sign_in_path_for(resource)
    if resource.teacher
      teaching_group_upcoming_path(teaching_group_id: resource.teacher_teaching_groups.first)
    elsif resource.guardian
      child_upcoming_path(child_id: resource.students.first)
    else
      teaching_group_upcoming_path(teaching_group_id: resource.student_teaching_groups.first)
    end
  end

  def after_sign_out_path_for(resource)
    root_path
  end

  private

  def skip_pundit?
    devise_controller? || params[:controller] =~ /(^(rails_)?admin)|(^pages$)/
  end
end
