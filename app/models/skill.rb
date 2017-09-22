class Skill < ApplicationRecord
  has_many :student_skills
  has_many :job_skills
  validates :name, presence: true
end
