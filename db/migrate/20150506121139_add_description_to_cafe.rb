class AddDescriptionToCafe < ActiveRecord::Migration
  def change
    add_column :cafes, :description, :text
  end
end
