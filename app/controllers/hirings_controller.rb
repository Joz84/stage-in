class HiringsController < ApplicationController
  def index
    # @companies = Hiring.pending.map(&:company)
    @companies = User.where(role: "company").first(10)
    @hash = Gmaps4rails.build_markers(@companies) do |user, marker|
      marker.lat user.latitude
      marker.lng user.longitude
      marker.infowindow user.company
      marker.picture({
        :url     => if user.distance_to(current_user) < 5
                      "http://res.cloudinary.com/zanzibar/image/upload/v1506266970/GREEN_hkaart.png"
                    elsif user.distance_to(current_user) < 10
                      "http://res.cloudinary.com/zanzibar/image/upload/v1506266970/ORANGE_fmuvmg.png"
                    else
                      "http://res.cloudinary.com/zanzibar/image/upload/v1506266970/RED_onahwf.png"
                    end,
        :width   => 32,
        :height  => 32,
        })
    end
  end

  def show
    @hiring = Hiring.find(params[:id])
  end
end
