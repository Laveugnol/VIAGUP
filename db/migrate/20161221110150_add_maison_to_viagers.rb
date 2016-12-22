class AddMaisonToViagers < ActiveRecord::Migration[5.0]
  def change
    add_column :viagers, :maison, :string
  end
end
