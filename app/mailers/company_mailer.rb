class CompanyMailer < ApplicationMailer
  def student_contact(company, student)
    @company = company
    @student = student
    mail(to: @company.email, subject: '>> Stage-In - Prise de contact')
  end

  def welcome(user)
    @user = user  # Instance variable => available in view
    mail(to: @user.email, subject: ">> Stage-In - Bienvenue")
  end

end
