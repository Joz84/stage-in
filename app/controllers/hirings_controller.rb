class HiringsController < ApplicationController
  def index
    @hirings = Hiring.all
    @companies = Hiring.pending.map(&:company)
    @hash = Gmaps4rails.build_markers(@companies) do |user, marker|
      marker.lat user.latitude
      marker.lng user.longitude
      marker.infowindow user.company
      marker.picture({
        :url     => if user.id > 30
                      "https://s3-media2.fl.yelpcdn.com/assets/srv0/yelp_styleguide/118ff475a341/assets/img/logos/favicon.ico"
                    else
                      "https://cdn4.iconfinder.com/data/icons/new-google-logo-2015/400/new-google-favicon-32.png"
                    end,
        :width   => 32,
        :height  => 32
        })
    end
  end

  def show
    @hiring = Hiring.find(params[:id])
  end
end
