class AdminMailerPreview < ActionMailer::Preview
  def new_company
    user = User.where(role: :company).first
    AdminMailer.new_company(user)
  end
end
