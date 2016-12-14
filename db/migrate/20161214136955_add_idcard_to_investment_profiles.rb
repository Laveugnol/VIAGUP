class AddIdcardToInvestmentProfiles < ActiveRecord::Migration[5.0]
  def change
    add_column :investment_profiles, :idcard, :string
  end
end
