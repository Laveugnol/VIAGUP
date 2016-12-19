class AddDocsentToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :doc_sent, :boolean, :default => false
  end
end
