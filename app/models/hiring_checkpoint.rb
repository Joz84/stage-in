class HiringCheckpoint < ApplicationRecord
  belongs_to :checkpoint
  belongs_to :student_hiring
  validates :checkpoint, presence: true
  # delegate :order, to: :checkpoint, allow_nil: true
end
