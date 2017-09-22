class StudentSkill < ApplicationRecord
  belongs_to :student, class_name: "User"
  belongs_to :skill
  validates :student, presence: true
  validates :skill, presence: true
  validates :weight, presence: true
end
