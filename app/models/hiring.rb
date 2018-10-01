class Hiring < ApplicationRecord
  belongs_to :company, class_name: "User"
  belongs_to :internship
  has_many :student_hirings
  validates :internship, presence: true
  validates :company, presence: true

  def self.pending
    pendings = []
    all.each do |h|
      pendings << h unless h.accepted?
    end
    pendings
  end

  def self.visibles
    where(visible: true)
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

  def not_visible
    update(visible: false)
  end

  def score(user)
    company
    .skill
    .student_skills
    .find_by(student: user)
    .score
  end

  def self.group_by_score(user)
    joins(:internship)
    .where(internships: {college_id: user.college_id})
    .group_by { |h| h.score(user) }.sort{|x,y| y <=> x }.to_h
  end

end
