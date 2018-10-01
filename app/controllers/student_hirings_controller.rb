class StudentHiringsController < ApplicationController
  def create
    @hiring = Hiring.find(params[:hiring_id])
    @student_hiring = @hiring.student_hirings.find_or_initialize_by(student: current_user)
    if @student_hiring.id.nil?
      @student_hiring.save
      # @student_hiring.hiring_checkpoints.create(checkpoint_ids: Checkpoint.all.map(&:id) )
      Checkpoint.all.each do |checkpoint|
        checkpoint.hiring_checkpoints.create(student_hiring: @student_hiring)
      end
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
