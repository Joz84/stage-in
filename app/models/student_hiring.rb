class StudentHiring < ApplicationRecord
  belongs_to :student, class_name: "User"
  belongs_to :hiring
  has_many :hiring_checkpoints
  validates :state, presence: true
  enum state: { pending: 0, required: 1, accepted: 2, denied: 3 }

  def checked?
    total_check = true
    hiring_checkpoints.each{ |hc| total_check &&= hc.checked }
    total_check
  end
end
