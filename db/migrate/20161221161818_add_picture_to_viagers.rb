class AddPictureToViagers < ActiveRecord::Migration[5.0]
  def change
    add_column :viagers, :salon, :string
    add_column :viagers, :chambre, :string
    add_column :viagers, :exterieur, :string
  end
end
