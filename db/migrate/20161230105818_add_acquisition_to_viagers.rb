class AddAcquisitionToViagers < ActiveRecord::Migration[5.0]
  def change
    add_column :viagers, :acquisition, :datetime
  end
end
