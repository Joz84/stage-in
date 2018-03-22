class Skill < ApplicationRecord
  has_many :student_skills
  has_many :users
  validates :name, presence: true
  has_attachment :photo
end
