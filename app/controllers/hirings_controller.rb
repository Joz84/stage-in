class HiringsController < ApplicationController
  def index
    begin
      @hirings = Hiring.visibles
                       .not_accepteds
                       .not_denieds_for(current_user)
                       .group_by_score(current_user)
    rescue
      @hirings = { 3 => Hiring.college_filter(current_user) }
    end
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
    @companies = User.companies
    @hash = current_user.gmap_hash(User.companies.with_lng_lat.limit(10))
  end

  def show
    @hiring = Hiring.find(params[:id])
  end

end
