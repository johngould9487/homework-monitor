class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :student_group_memberships
  has_many :teacher_group_memberships
  # has_many :teaching_groups, through: :student_group_memberships
  # has_many :teaching_groups, through: :teacher_group_memberships

  has_many :attempts
  # has_many :assignments, through: :attempts
end
