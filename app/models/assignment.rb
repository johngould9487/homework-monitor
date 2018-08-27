class Assignment < ApplicationRecord
  belongs_to :teaching_group
  has_many :attempts
end
