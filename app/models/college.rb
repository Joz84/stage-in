class College < ApplicationRecord
  has_many :students, foreign_key: :user_id, class_name: "User"
  has_many :internships
  has_many :hirings, through: :internships
end
