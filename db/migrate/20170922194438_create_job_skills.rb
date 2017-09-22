class CreateJobSkills < ActiveRecord::Migration[5.0]
  def change
    create_table :job_skills do |t|
      t.references :job, foreign_key: true
      t.references :skill, foreign_key: true
      t.float :weight

      t.timestamps
    end
  end
end
