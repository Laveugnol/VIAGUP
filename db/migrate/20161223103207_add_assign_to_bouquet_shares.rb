class AddAssignToBouquetShares < ActiveRecord::Migration[5.0]
  def change
    add_column :bouquet_shares, :assign, :boolean, :default => false
  end
end
