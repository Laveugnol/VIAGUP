class AddAssignToRenteShares < ActiveRecord::Migration[5.0]
  def change
    add_column :rente_shares, :assign, :boolean, :default => false
  end
end
