class HiringsController < ApplicationController
  def index
    # @hirings = Hiring.all
    # @companies = User.where(role: "company")
    #                  .where
    #                  .not(latitude: nil, longitude: nil)
    #                  .limit(10)
    # @hash = Gmaps4rails.build_markers(@companies) do |user, marker|
    #   marker.lat user.latitude
    #   marker.lng user.longitude
    #   marker.infowindow user.company
    #   marker.picture({
    #     url: "http://res.cloudinary.com/zanzibar/image/upload/v1506266970/RED_onahwf.png",
    #     width: 32,
    #     height: 32,
    #     })
    # end
    @companies = User.companies.with_lng_lat.limit(10)
    @hash = current_user.gmap_hash(@companies)
  end

  def show
    @hiring = Hiring.find(params[:id])
  end


  # A refacto avec une possibilité d'archiver les offres
  def destroy
    @hiring = Hiring.find(params[:id])
    @hiring.destroy
    redirect_to company_hirings_path
  end
end
