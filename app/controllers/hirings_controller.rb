class HiringsController < ApplicationController
  def index
    @user = current_user
    @companies = User.where(role: 'company')
    @hirings = Hiring.pending
    @hirings_users = []
    @hirings.each do |h|
      @hirings_users << h.company
    end
    @hash = Gmaps4rails.build_markers(@hirings_users) do |user, marker|
      marker.lat user.latitude
      marker.lng user.longitude
      # marker.json({ address: user.address })
    end
  end

  def show
    @hiring = Hiring.find(params[:id])
  end
end
