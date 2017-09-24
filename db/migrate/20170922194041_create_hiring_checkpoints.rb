class CreateHiringCheckpoints < ActiveRecord::Migration[5.0]
  def change
    create_table :hiring_checkpoints do |t|
      t.references :checkpoint, foreign_key: true
      t.references :hiring, foreign_key: true
      t.integer :order
      t.boolean :checked, default: false

      t.timestamps
    end
  end
end
