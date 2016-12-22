class AddProjetToOlds < ActiveRecord::Migration[5.0]
  def change
    add_column :olds, :projet, :text
  end
end
