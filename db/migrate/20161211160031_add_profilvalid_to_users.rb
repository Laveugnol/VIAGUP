class AddProfilvalidToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :profil_valid, :boolean, :default => false
  end
end
