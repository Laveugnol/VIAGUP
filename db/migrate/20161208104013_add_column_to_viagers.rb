class AddColumnToViagers < ActiveRecord::Migration[5.0]
  def change
    add_column :viagers, :tri, :float
  end
end
