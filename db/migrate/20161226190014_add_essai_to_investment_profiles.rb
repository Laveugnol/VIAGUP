class AddEssaiToInvestmentProfiles < ActiveRecord::Migration[5.0]
  def change
    add_column :investment_profiles, :essai, :string
  end
end
