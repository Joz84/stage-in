class AddCollegeToInternship < ActiveRecord::Migration[5.0]
  def change
    add_reference :internships, :college, foreign_key: true
  end
end
