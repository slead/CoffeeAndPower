class AddIndexToSlugs < ActiveRecord::Migration
  def change
    add_index :cafes, :slug, :unique => true
  end
end
