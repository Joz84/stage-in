class Hiring < ApplicationRecord
  belongs_to :student, class_name: "User"
  belongs_to :company, class_name: "User"
  belongs_to :internship
  belongs_to :job
  has_many :hiring_checkpoints
  validates :student_id, presence: true
  validates :internship_id, presence: true
  validates :company_id, presence: true
  validates :job_id, presence: true
  validates :status, presence: true
end
