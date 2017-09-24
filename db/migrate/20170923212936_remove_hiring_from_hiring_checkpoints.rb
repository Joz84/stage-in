class RemoveHiringFromHiringCheckpoints < ActiveRecord::Migration[5.0]
  def change
    remove_reference :hiring_checkpoints, :hiring, foreign_key: true
    remove_column :hiring_checkpoints, :order, :integer
  end
end
