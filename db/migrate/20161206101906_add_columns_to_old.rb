class AddColumnsToOld < ActiveRecord::Migration[5.0]
  def change
    add_column :olds, :first_name, :string
    add_column :olds, :last_name, :string
  end
end
