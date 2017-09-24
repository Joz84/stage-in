class HiringsController < ApplicationController
  def index
    @companies = Hiring.pending.map(&:company)
    @hash = Gmaps4rails.build_markers(@companies) do |user, marker|
      marker.lat user.latitude
      marker.lng user.longitude
      # marker.json({ address: user.address })
    end
  end

  def show
    @hiring = Hiring.find(params[:id])
  end
end
