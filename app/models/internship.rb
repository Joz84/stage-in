class Internship < ApplicationRecord
  has_many :hirings
  belongs_to :college, class_name: "User"

  def full_name
    "#{self.college.college_name} #{self.starts_at.strftime("du %d/%m/%Y")} #{self.ends_at.strftime("au %d/%m/%Y")}"
  end

  def self.display_internship
    all
    .map{|i| [i.full_name, i.id] }
  end
end
