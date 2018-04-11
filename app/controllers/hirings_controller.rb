class HiringsController < ApplicationController
  def index
    @hirings_scores = []
    (0..3).each do |score|
      @skill_score = StudentSkill.where(student_id: current_user.id, score: score).map{|ss| ss.skill}
      @hirings_scores[score] = []
      @skill_score.each do |skill|
        @hirings_scores[score] << Hiring.all.select{ |hiring| (hiring if hiring.skill == skill) }
      end
      @hirings_scores[score].flatten!
    end

    @hirings = @hirings_scores.reverse!
    @preference = ['"pas du tout... mais qui sait ?"', '"un peu"', '"beaucoup"', '"à la folie"'].reverse

    @companies = User.companies.with_lng_lat.limit(10)
    @hash = current_user.gmap_hash(@companies)
  end

  def show
    @hiring = Hiring.find(params[:id])
  end
end
