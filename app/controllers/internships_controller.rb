class InternshipsController < ApplicationController
  def index
    @user = current_user
    @interships = User.all.where(role: 'company')
    @hash = Gmaps4rails.build_markers(@internships) do |user, marker|
      marker.lat user.latitude
      marker.lng user.longitude
      marker.json({ address: user.address })
    end
  end
end
