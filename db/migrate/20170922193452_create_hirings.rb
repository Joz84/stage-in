class CreateHirings < ActiveRecord::Migration[5.0]
  def change
    create_table :hirings do |t|
      t.references :company, references: :users
      t.references :internship, foreign_key: true
      t.references :job, foreign_key: true

      t.timestamps
    end
  end
end
