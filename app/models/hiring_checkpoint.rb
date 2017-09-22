class HiringCheckpoint < ApplicationRecord
  belongs_to :checkpoint
  belongs_to :hiring
  validates :checkpoint, presence: true
  validates :order, presence: true
  validates :checked, presence: true
end
