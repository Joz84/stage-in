class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!
  before_action :set_locale
  before_action :configure_permitted_parameters, if: :devise_controller?


  def set_locale
    I18n.locale = :fr
  end

  def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:role, :first_name, :last_name, :address, :level, :phone, :company, :email, :password])
  end

end
