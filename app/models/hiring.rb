class Hiring < ApplicationRecord
  belongs_to :company, class_name: "User"
  belongs_to :internship
  belongs_to :job
  has_many :student_hirings
  has_many :hiring_checkpoints
  validates :internship, presence: true
  validates :company, presence: true
  validates :job, presence: true

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

  def promote_on_facebook
    @graph = Koala::Facebook::API.new(ENV['FACEBOOK_API_TOKEN'])
  end
end
