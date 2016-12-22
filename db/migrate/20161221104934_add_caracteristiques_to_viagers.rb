class AddCaracteristiquesToViagers < ActiveRecord::Migration[5.0]
  def change
    add_column :viagers, :type, :string
    add_column :viagers, :habitable, :string
    add_column :viagers, :piece, :string
    add_column :viagers, :niveaux, :string
    add_column :viagers, :ascenceur, :boolean
    add_column :viagers, :balcon, :boolean
    add_column :viagers, :annee, :string
    add_column :viagers, :terrain, :string
    add_column :viagers, :annexe, :string
  end
end
