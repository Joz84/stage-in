class StudentHiring < ApplicationRecord
  belongs_to :student, class_name: "User"
  belongs_to :hiring
  enum state: { pending: 0, required: 1, accepted: 2, denied: 3 }
  validates :state, presence: true
end
