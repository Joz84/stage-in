class AddUserToInternship < ActiveRecord::Migration[5.0]
  def change
    remove_reference :internships, :college, foreign_key: true
    add_reference :internships, :college, foreign_key: { to_table: :users }
  end
end
