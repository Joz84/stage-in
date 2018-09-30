class UsersController < ApplicationController
  def update_college_acceptation
    @user = User.find(params[:id])
    @user.update(college_acceptation: true)
    flash[:alert] = "Nouvel élève validée avec succés !"
    redirect_to rooth_path
  end
end
