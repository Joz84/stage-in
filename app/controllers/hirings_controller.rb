class HiringsController < ApplicationController
  def index
    @user = current_user
    @companies = Hiring.pending.map do |h| h.company end
    @hirings = Hiring.pending
    @hirings_users = []
    @hirings.each do |h|
      @hirings_users << h.company
    end
    @hash = Gmaps4rails.build_markers(@hirings_users) do |user, marker|
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
