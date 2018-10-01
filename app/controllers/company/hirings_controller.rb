class Company::HiringsController < ApplicationController
  def index
    @hirings = current_user.company_hirings.where(visible: true)
    @company_name = current_user.company
  end

  def create
    valid_params = true
    hiring_params[:number].to_i.times do
      filter_params = hiring_params
      filter_params.delete(:number)
      @hiring = Hiring.new(filter_params)
      @hiring.company = current_user
      valid_params &&= @hiring.save
    end
    if valid_params
      @hirings = current_user.company_hirings
      redirect_to company_hirings_path
    else
      render :index
    end
  end

  # A refacto avec une possibilité d'archiver les offres
  def update
    @hiring = Hiring.find(params[:id])
    @hiring.not_visible!
    redirect_to company_hirings_path
  end

  private

  def hiring_params
    params.require(:hiring).permit(:job_id, :internship_id, :number, :visible)
  end
end
