class AddCollegeToUser < ActiveRecord::Migration[5.0]
  def change
    add_reference :users, :college, foreign_key: true
  end
end
