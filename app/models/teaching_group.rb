class TeachingGroup < ApplicationRecord
  has_many :assignments
  has_many :student_group_memberships
  has_many :teacher_group_memberships
  # has_many :users, through: :student_group_memberships
  # has_many :users, through: :teacher_group_memberships
end
