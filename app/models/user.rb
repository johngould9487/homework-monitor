class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # has_many :student_group_memberships
  # has_many :teacher_group_memberships
  # has_many :teaching_groups, through: :student_group_memberships
  # has_many :teaching_groups, through: :teacher_group_memberships

  has_many :attempts
  # has_many :assignments, through: :attempts

  has_many :guardian_connections, class_name: "FamilyConnection", foreign_key: "student_id"
  has_many :guardians, through: :guardian_connections, source: :guardian

  has_many :student_connections, class_name: "FamilyConnection", foreign_key: "guardian_id"
  has_many :students, through: :student_connections, source: :student


  has_many :teacher_group_memberships, foreign_key: "teacher_id"
  has_many :teaching_groups, through: :teacher_group_memberships

  has_many :student_group_memberships, foreign_key: "student_id"
  has_many :teaching_groups, through: :student_group_memberships
end
