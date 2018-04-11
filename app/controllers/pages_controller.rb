class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home, :redirect_to_inscription]

  def home
  end

  def redirect_to_inscription
    session[:role] = params[:query][:role]
    redirect_to new_user_registration_path
  end
end
