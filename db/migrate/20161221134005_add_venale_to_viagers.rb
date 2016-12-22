class AddVenaleToViagers < ActiveRecord::Migration[5.0]
  def change
    add_column :viagers, :venale, :string
  end
end
