class CreateColleges < ActiveRecord::Migration[5.0]
  def change
    create_table :colleges do |t|
      t.string :name
      t.string :city
      t.string :address
      t.boolean :visible, default: true

      t.timestamps
    end
  end
end
