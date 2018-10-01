class AdminMailer < ApplicationMailer

  def new_company(user)
    @user = user  # Instance variable => available in view
    @companies = User.companies
    mail(to: "y.couvant@cc-paysriberacois.fr", subject: ">> Stage-In - Inscription d'une nouvelle entreprise")
  end
end
