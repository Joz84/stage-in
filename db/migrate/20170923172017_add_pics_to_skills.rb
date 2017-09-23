class AddPicsToSkills < ActiveRecord::Migration[5.0]
  def change
    add_column :skills, :photo1, :string
    add_column :skills, :photo2, :string
  end
end
