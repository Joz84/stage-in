class Hiring < ApplicationRecord
  belongs_to :student, class_name: "User"
  belongs_to :company, class_name: "User"
  belongs_to :internship
  belongs_to :job
  has_many :hiring_checkpoints
  validates :student, presence: true
  validates :internship, presence: true
  validates :company, presence: true
  validates :job, presence: true
  validates :status, presence: true
end
