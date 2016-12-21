class CreateFounders < ActiveRecord::Migration[5.0]
  def change
    create_table :founders do |t|
      t.string :tete
      t.string :citation

      t.timestamps
    end
  end
end
