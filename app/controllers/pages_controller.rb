class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
    if user_signed_in?
      @teaching_group = current_user.teacher_teaching_groups.first
    end
  end
end
