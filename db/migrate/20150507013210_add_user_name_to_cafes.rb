class AddUserNameToCafes < ActiveRecord::Migration
  def change
    add_column :cafes, :username, :string
  end
end
