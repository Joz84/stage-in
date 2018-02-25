class Hiring < ApplicationRecord
  belongs_to :company, class_name: "User"
  belongs_to :internship
  belongs_to :skill
  has_many :student_hirings
  validates :internship, presence: true
  validates :company, presence: true
  validates :skill, presence: true

  def self.pending
    pendings = []
    all.each do |h|
      pendings << h unless h.accepted?
    end
    pendings
  end

  def accepted?
    accepted_student_hirings
    .any?
  end

  def required?
    required_student_hirings
    .any?
  end

  def required_student_hirings
    student_hirings
    .where(state: :required)
  end


  def accepted_student_hirings
    student_hirings
    .where(state: :accepted)
  end
end
