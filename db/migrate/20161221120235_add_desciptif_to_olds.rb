class AddDesciptifToOlds < ActiveRecord::Migration[5.0]
  def change
    add_column :olds, :descriptif, :text
  end
end
