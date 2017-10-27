class AddDetailsToSpots < ActiveRecord::Migration[5.1]
  def change
    add_column :spots, :latitude, :float
    add_column :spots, :longitude, :float
    add_column :spots, :address, :string
  end
end
