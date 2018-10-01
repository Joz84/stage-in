class CollegeMailer < ApplicationMailer
  def student_confirmation(user)
    @user = user  # Instance variable => available in view
    mail(to: @user.college.email, subject: '>> Stage-In - Nouvelle Inscription Eleve')
  end

  def contact(company, student)
    @company = company
    @student = student
    mail(to: @student.college.email, subject: '>> Stage-In - Prise de contact')
  end
end
