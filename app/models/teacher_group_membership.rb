class TeacherGroupMembership < ApplicationRecord
  belongs_to :teacher_teaching_group, class_name: "TeachingGroup"
  belongs_to :teacher, class_name: "User"
end
