class AddProfilcompletedToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :profil_completed, :boolean, :default => false
  end
end
