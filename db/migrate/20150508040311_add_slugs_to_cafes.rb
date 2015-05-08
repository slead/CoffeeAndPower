class AddSlugsToCafes < ActiveRecord::Migration
  def change
    add_column :cafes, :slug, :string
  end
end
