class Skill < ApplicationRecord
  has_many :student_skills
  validates :name, presence: true
  has_attachment :photo
end
