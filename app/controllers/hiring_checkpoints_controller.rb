class HiringCheckpointsController < ApplicationController
  def update
    @hiring_checkpoint = HiringCheckpoint.find(params[:id])
    @hiring_checkpoint.update(checked: !@hiring_checkpoint.checked)
    @student_hiring = @hiring_checkpoint.student_hiring
    # @student_hiring.update(state: 1) if @student_hiring.checked?
    if @hiring_checkpoint.checkpoint.order == 1 && @hiring_checkpoint.checked
      @company = @student_hiring.hiring.company
      CompanyMailer.student_contact(@company, current_user).deliver_now
      StudentMailer.company_contact(@company, current_user).deliver_now
      CollegeMailer.contact(@company, current_user).deliver_now
    end
    # respond_to do |format|
    #   format.js
    # end
    @hiring = @student_hiring.hiring
    @hiring_checkpoints = @student_hiring.hiring_checkpoints
                                         .includes(:checkpoint)
                                         .order("checkpoints.order")
    redirect_to @student_hiring
  end
end
