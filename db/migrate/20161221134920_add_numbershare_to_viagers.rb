class AddNumbershareToViagers < ActiveRecord::Migration[5.0]
  def change
    add_column :viagers, :number_share, :integer
  end
end
