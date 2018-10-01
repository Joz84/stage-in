class UsersController < ApplicationController
  skip_before_action :authenticate_user!, only: [:update_college_acceptation]

  def update_college_acceptation
    @user = User.find_by(token: params[:token])
    @user.update(college_acceptation: true)
    StudentMailer.college_acceptation(@user).deliver_now
    flash[:notice] = "Nouvel élève validé avec succès !"
    redirect_to root_path
  end
end
