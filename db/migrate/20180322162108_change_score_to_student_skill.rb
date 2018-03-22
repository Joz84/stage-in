class ChangeScoreToStudentSkill < ActiveRecord::Migration[5.0]
  def change
    change_column :student_skills, :score, :integer
  end
end
