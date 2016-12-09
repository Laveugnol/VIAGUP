class AddColumnToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :twitter_picture_url, :string
  end
end
