class CreateInternships < ActiveRecord::Migration[5.0]
  def change
    create_table :internships do |t|
      t.string :name
      t.string :level
      t.datetime :starts_at
      t.datetime :ends_at
      t.text :comment

      t.timestamps
    end
  end
end
