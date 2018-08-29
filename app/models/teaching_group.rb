class TeachingGroup < ApplicationRecord
  has_many :assignments

  has_many :teacher_group_memberships, foreign_key: "teacher_teaching_group_id"
  has_many :teachers, through: :teacher_group_memberships

  has_many :student_group_memberships, foreign_key: "student_teaching_group_id"
  has_many :students, through: :student_group_memberships
end
