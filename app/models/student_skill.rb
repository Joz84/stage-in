class StudentSkill < ApplicationRecord
  belongs_to :student, class_name: "User"
  belongs_to :skill
  validates :student_id, presence: true
  validates :skill_id, presence: true
  validates :weight, presence: true
end
