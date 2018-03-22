class MyRegistrationsController < Devise::RegistrationsController
  def after_sign_up_path_for(resource)
    skill_path(Skill.first)
  end
end
