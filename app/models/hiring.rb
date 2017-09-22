class Hiring < ApplicationRecord
  belongs_to :student, class_name: "User"
  belongs_to :company, class_name: "User"
  belongs_to :internship
  belongs_to :job
  has_many :hiring_checkpoints
end
