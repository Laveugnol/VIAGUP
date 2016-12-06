class AddPhotoToViager < ActiveRecord::Migration[5.0]
  def change
    add_column :viagers, :photo, :string
  end
end
