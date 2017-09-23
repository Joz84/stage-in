class Company::StudentHiringsController < ApplicationController

  def update
    @student_hiring = StudentHiring.find(params[:id])
    @student_hiring.update(state: links_params[:state].to_i)
    if @student_hiring.accepted?
      @student_hiring.hiring.student_hirings.each do |student_hiring|
        student_hiring.denied! unless student_hiring.accepted?
      end
    end
    redirect_to company_hirings_path
  end

  def links_params
    params.permit(:state)
  end
end
