class AddPhotoToSkills < ActiveRecord::Migration[5.0]
  def change
    add_column :skills, :photo, :string
  end
end
