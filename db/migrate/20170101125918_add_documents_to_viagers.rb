class AddDocumentsToViagers < ActiveRecord::Migration[5.0]
  def change
    add_column :viagers, :statuts_sci, :string
    add_column :viagers, :pacte, :string
    add_column :viagers, :compte_courant, :string
    add_column :viagers, :acte_propriete, :string
  end
end
