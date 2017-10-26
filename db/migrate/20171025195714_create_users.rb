class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :password_digest
      t.string :gender
      t.string :sports
      t.string :username
      t.integer :age
      t.string :self_description

      t.timestamps
    end
  end
end
