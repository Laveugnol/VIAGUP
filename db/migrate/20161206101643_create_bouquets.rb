class CreateBouquets < ActiveRecord::Migration[5.0]
  def change
    create_table :bouquets do |t|
      t.integer :quantity

      t.timestamps
    end
  end
end
