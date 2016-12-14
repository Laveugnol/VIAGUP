class AddJustifictifToInvestmentProfiles < ActiveRecord::Migration[5.0]
  def change
    add_column :investment_profiles, :justificatif, :string
  end
end
