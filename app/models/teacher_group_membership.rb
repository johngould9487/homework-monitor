class TeacherGroupMembership < ApplicationRecord
  belongs_to :teaching_group
  belongs_to :teacher, class_name: "User" #?
end
