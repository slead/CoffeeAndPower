class CreateCafes < ActiveRecord::Migration
  def change
    create_table :cafes do |t|
      t.string :name
      t.string :address
      t.string :city
      t.string :country

      t.timestamps
    end
  end
end
