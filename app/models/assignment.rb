class Assignment < ApplicationRecord
  belongs_to :teaching_group
  has_many :attempts, foreign_key:"assignment_id"
  has_many :students, through: :attempts

  after_save  do |assignment|
    assignment.teaching_group.students.each do |student|
      Attempt.create(assignment:assignment, student:student, completed:false)
    end
  end
end
