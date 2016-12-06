class CreateRentes < ActiveRecord::Migration[5.0]
  def change
    create_table :rentes do |t|
      t.integer :quantity

      t.timestamps
    end
  end
end
