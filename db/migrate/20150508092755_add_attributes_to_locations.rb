class AddAttributesToLocations < ActiveRecord::Migration
  def change
    add_column :locations, :name, :string
    add_column :locations, :latitude, :float
    add_column :locations, :longitude, :float
  end
end
