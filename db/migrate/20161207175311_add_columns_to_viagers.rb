class AddColumnsToViagers < ActiveRecord::Migration[5.0]
  def change
    add_column :viagers, :bouquet, :integer
    add_column :viagers, :rente, :integer
    add_column :viagers, :horizon, :integer
  end
end
