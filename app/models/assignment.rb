class Assignment < ApplicationRecord
  belongs_to :teaching_group
  has_many :attempts, foreign_key:"assignment_id"
  has_many :students, through: :attempts

  after_create do |assignment|
    assignment.teaching_group.students.each do |student|
      Attempt.create(assignment: assignment, student: student, completed: false)
    end
  end

  def attempt_percentage
    (attempts.count / students.count) * 100
  end

  def marked_percentage
    marked_attempts = self.attempts.count { |attempt| !attempt.mark.nil? }
    ((marked_attempts / attempts.count.to_f) * 100).round
  end

  def days_left
    (date_due.to_date - DateTime.now).to_i
  end

end
