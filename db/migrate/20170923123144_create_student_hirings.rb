class CreateStudentHirings < ActiveRecord::Migration[5.0]
  def change
    create_table :student_hirings do |t|
      t.references :hiring, foreign_key: true
      t.references :student, references: :users
      t.integer :state, default: 0

      t.timestamps
    end
  end
end
