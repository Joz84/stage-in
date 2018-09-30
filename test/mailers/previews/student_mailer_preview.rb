class StudentMailerPreview < ActionMailer::Preview
  def welcome
    user = User.where(role: :student).first
    StudentMailer.welcome(user)
  end
end
