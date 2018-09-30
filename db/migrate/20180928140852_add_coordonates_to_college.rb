class AddCoordonatesToCollege < ActiveRecord::Migration[5.0]
  def change
    add_column :colleges, :latitude, :float
    add_column :colleges, :longitude, :float
  end
end
