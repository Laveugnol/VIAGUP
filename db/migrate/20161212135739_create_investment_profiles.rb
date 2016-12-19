class CreateInvestmentProfiles < ActiveRecord::Migration[5.0]
  def change
    create_table :investment_profiles do |t|
      t.boolean :question1
      t.boolean :question2
      t.string :civilite
      t.string :nom
      t.string :prenom
      t.string :categoriesp
      t.string :expertise
      t.string :adresse
      t.string :complementadresse
      t.string :code_postal
      t.string :country
      t.datetime :birth_date
      t.string :birth_place
      t.string :phone
      t.string :mobile
      t.string :ville
      t.string :nationalite
      t.string :invest1
      t.string :invest2
      t.string :invest3
      t.string :invest4
      t.string :invest5
      t.string :invest6
      t.string :invest7
      t.string :invest8
      t.string :patrimoine1
      t.string :patrimoine2
      t.string :patrimoine3
      t.string :patrimoine4
      t.string :patrimoine5
      t.string :patrimoine6
      t.string :patrimoine7
      t.string :patrimoine8
      t.string :patrimoine9
      t.string :blanchiement1
      t.string :blanchiement2
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
