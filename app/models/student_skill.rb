class StudentSkill < ApplicationRecord
  belongs_to :student, class_name: "User"
  belongs_to :skill

  validates :student, presence: true
  validates :skill, presence: true
  validates :score, presence: true

  def self.score_names
    [
      "Pas du tout",
      "Un peu",
      "Beaucoup",
      "À la folie"
    ]
  end

end
