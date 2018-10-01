class AddVisibleToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :college_name, :string
    add_column :users, :visible, :boolean
    add_column :users, :college_acceptation, :boolean
    remove_reference :users, :college, foreign_key: true
    add_reference :users, :college, foreign_key: { to_table: :users }
  end
end
