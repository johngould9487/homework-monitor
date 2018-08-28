class StudentGroupMembership < ApplicationRecord
  belongs_to :teaching_group
  belongs_to :student, class_name: "User"
end
