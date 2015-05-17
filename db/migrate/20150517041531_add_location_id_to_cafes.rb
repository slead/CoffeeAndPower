class AddLocationIdToCafes < ActiveRecord::Migration
  def change
    add_column :cafes, :location_id, :integer
  end
end
