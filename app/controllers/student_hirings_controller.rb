class StudentHiringsController < ApplicationController
  def create
    @hiring = Hiring.find(params[:hiring_id])
    @student_hiring = @hiring.student_hirings.create(student: current_user)
    Checkpoint.all.each do |checkpoint|
      checkpoint.hiring_checkpoints.create(student_hiring: @student_hiring)
    end
    redirect_to @student_hiring
  end

  def show
    @student_hiring = StudentHiring.find(params[:id])
    @hiring = @student_hiring.hiring
    @hiring_checkpoints = @student_hiring.hiring_checkpoints
                                         .includes(:checkpoint)
                                         .order("checkpoints.order")
  end
end
