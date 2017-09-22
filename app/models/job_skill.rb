class JobSkill < ApplicationRecord
  belongs_to :job
  belongs_to :skill
  validates :job, presence: true
  validates :skill, presence: true
  validates :weight, presence: true
end
