class CreateOlds < ActiveRecord::Migration[5.0]
  def change
    create_table :olds do |t|
      t.integer :age
      t.integer :lifespan

      t.timestamps
    end
  end
end
