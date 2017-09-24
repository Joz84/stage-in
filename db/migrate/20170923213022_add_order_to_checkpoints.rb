class AddOrderToCheckpoints < ActiveRecord::Migration[5.0]
  def change
    add_column :checkpoints, :order, :integer
  end
end
