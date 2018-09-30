class AddVisibleToHiring < ActiveRecord::Migration[5.0]
  def change
    add_column :hirings, :visible, :boolean, default: true
  end
end
