class AddLocationToCafes < ActiveRecord::Migration
  def change
    add_column :cafes, :latitude, :float
    add_column :cafes, :longitude, :float
  end
end
