class Checkpoint < ApplicationRecord
  has_many :hiring_checkpoints
  validates :title, presence: true
end
