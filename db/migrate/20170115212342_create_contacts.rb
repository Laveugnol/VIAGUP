class CreateContacts < ActiveRecord::Migration[5.0]
  def change
    create_table :contacts do |t|
      t.string :fullname
      t.string :email
      t.string :subject
      t.string :phone
      t.text :message

      t.timestamps
    end
  end
end
