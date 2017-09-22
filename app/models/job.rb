class Job < ApplicationRecord
  has_many :job_skills
  has_many :hirings
end
