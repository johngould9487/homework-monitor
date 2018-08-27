class TeacherGroupMembership < ApplicationRecord
  belongs_to :teaching_group
  belongs_to :user
end
