class AddUserIdToCafes < ActiveRecord::Migration
  def change
    add_column :cafes, :user_id, :integer
  end
end
