class StudentGroupMembership < ApplicationRecord
  belongs_to :teaching_group
  belongs_to :user
end
