class StudentMailer < ApplicationMailer
  def welcome(user)
    @user = user  # Instance variable => available in view

    mail(to: @user.email, subject: ">> Stage-In - Bienvenue")
  end
end
