class AddCoordinatesToViagers < ActiveRecord::Migration[5.0]
  def change
    add_column :viagers, :latitude, :float
    add_column :viagers, :longitude, :float
  end
end
