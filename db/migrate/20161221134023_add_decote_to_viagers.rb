class AddDecoteToViagers < ActiveRecord::Migration[5.0]
  def change
    add_column :viagers, :decote, :string
  end
end
