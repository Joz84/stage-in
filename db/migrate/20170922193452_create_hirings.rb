class CreateHirings < ActiveRecord::Migration[5.0]
  def change
    create_table :hirings do |t|
      t.references :student, references: :users
      t.references :company, references: :users
      t.references :internship, foreign_key: true
      t.references :job, foreign_key: true
      t.integer :state

      t.timestamps
    end
  end
end
