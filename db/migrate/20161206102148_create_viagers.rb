class CreateViagers < ActiveRecord::Migration[5.0]
  def change
    create_table :viagers do |t|
      t.string :address
      t.string :city
      t.string :zip_code
      t.string :country
      t.references :old, foreign_key: true

      t.timestamps
    end
  end
end
