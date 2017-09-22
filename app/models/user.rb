class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :student_skills
  has_many :hirings
  has_many :skills, through: :student_skills

  geocoded_by :address
  after_validation :geocode, if: :address_changed?
end
