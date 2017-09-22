class AddColumnsToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :role, :integer
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :company, :string
    add_column :users, :level, :string
    add_column :users, :address, :string
    add_column :users, :phone, :string
  end
end
