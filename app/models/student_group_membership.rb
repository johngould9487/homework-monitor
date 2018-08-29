class StudentGroupMembership < ApplicationRecord
  belongs_to :student_teaching_group, class_name: "TeachingGroup"
  belongs_to :student, class_name: "User"
end
