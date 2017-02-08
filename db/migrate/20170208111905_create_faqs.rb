class CreateFaqs < ActiveRecord::Migration[5.0]
  def change
    create_table :faqs do |t|
      t.string :theme
      t.string :question
      t.string :photo

      t.timestamps
    end
  end
end
