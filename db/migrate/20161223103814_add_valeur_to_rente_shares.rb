class AddValeurToRenteShares < ActiveRecord::Migration[5.0]
  def change
    add_column :rente_shares, :valeur, :integer
  end
end
