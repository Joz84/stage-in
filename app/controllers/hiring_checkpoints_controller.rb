class HiringCheckpointsController < ApplicationController
  def update
    @hiring_checkpoint = HiringCheckpoint.find(params[:id])
    @check = @hiring_checkpoint.checked == false
    @hiring_checkpoint.update(checked: @check)
    @student_hiring = @hiring_checkpoint.student_hiring
    @student_hiring.update(state: 1) if @student_hiring.checked?
    respond_to do |format|
      format.js
    end
  end
end
