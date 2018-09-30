class CollegeMailerPreview < ActionMailer::Preview
  def student_confirmation
    user = User.where(role: :student).first
    CollegeMailer.student_confirmation(user)
  end
end
