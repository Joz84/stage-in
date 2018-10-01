class CompanyMailer < ApplicationMailer
  def student_contact(company, student)
    @company = company
    @student = student
    mail(to: @company.email, subject: '>> Stage-In - Prise de contact')
  end
end
