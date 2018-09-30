class CollegeMailer < ApplicationMailer
  def student_confirmation
    @greeting = "Hi"

    mail to: "to@example.org"
  end
end
