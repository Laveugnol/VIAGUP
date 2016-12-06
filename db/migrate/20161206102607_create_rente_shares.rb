class CreateRenteShares < ActiveRecord::Migration[5.0]
  def change
    create_table :rente_shares do |t|
      t.references :user, foreign_key: true
      t.references :rente, foreign_key: true
      t.references :viager, foreign_key: true

      t.timestamps
    end
  end
end
