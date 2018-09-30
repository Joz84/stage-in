class AddEmailToCollege < ActiveRecord::Migration[5.0]
  def change
    add_column :colleges, :email, :string
  end
end
