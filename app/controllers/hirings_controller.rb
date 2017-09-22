class HiringsController < ApplicationController
  def index
    @user = current_user
    @hirings = User.all
    @hash = Gmaps4rails.build_markers(@hirings) do |user, marker|
      marker.lat user.latitude
      marker.lng user.longitude
      # marker.json({ address: user.address })
    end
  end
end
