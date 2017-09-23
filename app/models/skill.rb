class Skill < ApplicationRecord
  has_many :student_skills
  has_many :job_skills
  validates :name, presence: true
  has_attachments :photos, maximum: 2
end
