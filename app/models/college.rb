class College < ApplicationRecord
  has_many :students, foreign_key: :user_id, class_name: "User"
  has_many :internships
  has_many :hirings, through: :internships

  geocoded_by :address
  after_validation :geocode, if: :address_changed?

  def full_address
    "#{address} #{city}"
  end
end
