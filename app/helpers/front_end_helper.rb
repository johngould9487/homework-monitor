module FrontEndHelper
  def set_color
    if current_user.teacher
      'teacher-color'
    end
  end
end
