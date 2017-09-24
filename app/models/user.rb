class User < ApplicationRecord
  enum role: { company: 0, school: 1, student: 2 }
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :student_skills, foreign_key: :student_id, class_name: "Student_Skill"
  has_many :skills, through: :student_skills

  validates :role, presence: true
  validates :company, presence: true, if: :company?
  validates :level, presence: true, if: :student?
  validates :first_name, presence: true, if: :student?
  validates :last_name, presence: true, if: :student?
  validates :phone, presence: true


  has_many :company_hirings, foreign_key: :company_id, class_name: "Hiring"
  has_many :student_hirings, foreign_key: :student_id, class_name: "StudentHiring"

  geocoded_by :address
  after_validation :geocode, if: :address_changed?

  def full_name
    "#{first_name} #{last_name}"
  end

  def marker_color
    rand[]
  end
end
