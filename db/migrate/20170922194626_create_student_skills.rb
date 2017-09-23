class CreateStudentSkills < ActiveRecord::Migration[5.0]
  def change
    create_table :student_skills do |t|
      t.references :student, references: :users
      t.references :skill, foreign_key: true
      t.float :weight
      t.float :score
      t.timestamps
    end
  end
end
