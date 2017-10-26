class AddSelfDescriptionToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :self_description, :string
  end
end
