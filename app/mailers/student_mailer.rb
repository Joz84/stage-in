class StudentMailer < ApplicationMailer
  def welcome(user)
    @user = user  # Instance variable => available in view

    mail(to: @user.email, subject: ">> Stage-In - Bienvenue")
  end

  def college_acceptation(user)
    @user = user  # Instance variable => available in view
    mail(to: @user.email, subject: ">> Stage-In - Validation de votre compte")
  end

  def company_contact(company, student)
    @company = company
    @student = student
    mail(to: @student.email, subject: '>> Stage-In - Prise de contact')
  end

end
