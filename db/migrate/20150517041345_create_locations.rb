class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations do |t|
      t.string :name
      t.string :state
      t.string :country
      t.float :latitude
      t.float :longitude

      t.timestamps
    end
  end
end
