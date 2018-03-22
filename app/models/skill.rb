class Skill < ApplicationRecord
  has_many :student_skills
  has_many :companies
  has_many :hirings, through: :companies
  validates :name, presence: true
  has_attachment :photo
end
