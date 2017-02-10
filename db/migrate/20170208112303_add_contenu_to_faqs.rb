class AddContenuToFaqs < ActiveRecord::Migration[5.0]
  def change
    add_column :faqs,:contenu, :text
  end
end
