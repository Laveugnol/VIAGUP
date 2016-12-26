class AddProductToInvestmentProfiles < ActiveRecord::Migration[5.0]
  def change
    add_column :investment_profiles, :product, :integer
  end
end
