class AddStudentHiringToHiringCheckpoints < ActiveRecord::Migration[5.0]
  def change
    add_reference :hiring_checkpoints, :student_hiring, foreign_key: true
  end
end
