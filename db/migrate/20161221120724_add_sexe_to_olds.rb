class AddSexeToOlds < ActiveRecord::Migration[5.0]
  def change
    add_column :olds, :sexe, :string
  end
end
