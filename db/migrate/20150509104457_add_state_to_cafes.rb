class AddStateToCafes < ActiveRecord::Migration
  def change
    add_column :cafes, :state, :string
  end
end
