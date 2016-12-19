class AddCertificatToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :certificat, :boolean, :default => false
  end
end
