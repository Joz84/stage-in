class Company::HiringsController < ApplicationController
  def index
    @hirings = current_user.company_hirings
  end
end
