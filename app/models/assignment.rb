class Assignment < ApplicationRecord
  belongs_to :teaching_group
  has_many :attempts, foreign_key:"assignment_id"
  has_many :students, through: :attempts
end
