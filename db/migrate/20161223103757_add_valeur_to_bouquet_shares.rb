class AddValeurToBouquetShares < ActiveRecord::Migration[5.0]
  def change
    add_column :bouquet_shares, :valeur, :integer
  end
end
