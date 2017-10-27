class CreateSpots < ActiveRecord::Migration[5.1]
  def change
    create_table :spots do |t|
      t.string :name
      t.string :features
      t.integer :user_id
      t.integer :rating
      t.string :comments

      t.timestamps
    end
  end
end
