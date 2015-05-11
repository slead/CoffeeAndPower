class DropLocationIdFromCafes < ActiveRecord::Migration
  def change
    remove_column :cafes, :location_id
  end
end
