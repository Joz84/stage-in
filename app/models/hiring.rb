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

  def subscribed_by?(user)
    required_student_hirings
    .find_by(student: user)
    .present?
  end

  def accepted_for?(user)
    accepted_student_hirings
    .find_by(student: user)
    .present?
  end


  def denied_for?(user)
    denied_student_hirings
    .find_by(student: user)
    .present?
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

  def denied_student_hirings
    student_hirings
    .where(state: :denied)
  end

  def not_visible!
    update(visible: false)
  end

  def self.visibles
    where(visible: true)
  end

  def self.not_accepteds
    joins(:student_hirings)
    .where
    .not(student_hirings: {state: :accepted})
  end

  def self.not_denieds_for(user)
    joins(:student_hirings)
    .where
    .not(student_hirings: {state: :denied, student: user})
  end

  def score(user)
    company
    .skill
    .student_skills
    .find_by(student: user)
    .score
  end

  def self.college_filter(user)
    joins(:internship)
    .where(internships: {college_id: user.college_id})
  end

  def self.group_by_score(user)
    college_filter(user)
    .group_by { |h| h.score(user) }.sort{|x,y| y <=> x }.to_h
  end

end
