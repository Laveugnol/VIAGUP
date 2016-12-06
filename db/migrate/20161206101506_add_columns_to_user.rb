class AddColumnsToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :date_birth, :datetime
    add_column :users, :place_birth, :string
    add_column :users, :nationality, :string
    add_column :users, :country, :string
    add_column :users, :address, :string
    add_column :users, :city, :string
    add_column :users, :zip_code, :string
    add_column :users, :phone, :string
  end
end
