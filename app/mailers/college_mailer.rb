class CollegeMailer < ApplicationMailer
  def student_confirmation(user)
    @user = user  # Instance variable => available in view
    mail(to: @user.college.email, subject: '>> Stage-In - Nouvelle Inscription Eleve')
  end
end
