class Comment < ActiveRecord::Base
  belongs_to :cafe
  belongs_to :user
end
