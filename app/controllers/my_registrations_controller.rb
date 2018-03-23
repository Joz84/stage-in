class MyRegistrationsController < Devise::RegistrationsController
  def after_sign_up_path_for(resource)
    if resource.company?
      company_hirings_path(resource)
    elsif resource.student?
      skill_path(Skill.first)
    elsif resource.admin?
      # redirect_to user#show
    end
  end
end
