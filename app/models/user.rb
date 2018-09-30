class User < ApplicationRecord
  enum role: { company: 0, college: 1, student: 2 }
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :student_skills, foreign_key: :student_id, class_name: "Student_Skill"
  has_many :skills, through: :student_skills
  belongs_to :college, class_name: "User", optional: true, dependent: :delete
  has_many :internships

  # validates :college_id, presence: true, if: :student?
  validates :role, presence: true
  validates :company, presence: true, if: :company?
  validates :first_name, presence: true, if: :student?
  validates :last_name, presence: true, if: :student?
  validates :phone, presence: true, if: :company?

  has_many :company_hirings, foreign_key: :company_id, class_name: "Hiring"
  has_many :student_hirings, foreign_key: :student_id, class_name: "StudentHiring"

  geocoded_by :full_address
  after_validation :geocode, if: :address_changed?
  after_validation :geocode, if: :city_changed?
  after_validation :geocode, if: :zipcode_changed?

  def self.college_list_name
    colleges.map(&:college_name)
  end

  def self.colleges
    where(role: "college")
  end

  def full_address
    "#{num} #{address} #{zipcode} #{city}"
  end

  def full_name
    "#{first_name} #{last_name}"
  end

  def marker_color
    rand[]
  end

  def self.companies
    where(role: "company")
  end

  def self.with_lng_lat
    where
    .not(latitude: nil, longitude: nil)
  end

  def gmap_hash(users)
    Gmaps4rails.build_markers(users) do |user, marker|
      marker.lat user.latitude
      marker.lng user.longitude
      marker.infowindow user.company
      marker.picture({
        url: user.marker_picture(self),
        width: 32,
        height: 32,
        })
    end
  end

  def marker_picture(current_user)
    host = "http://res.cloudinary.com/zanzibar/image/upload/"
    if self.distance_to(current_user) < 5
      host + "v1506266970/GREEN_hkaart.png"
    elsif self.distance_to(current_user) < 10
      host + "v1506266970/ORANGE_fmuvmg.png"
    else
      host + "v1506266970/RED_onahwf.png"
    end
  end

end
