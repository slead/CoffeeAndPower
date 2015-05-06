class Cafe < ActiveRecord::Base
  belongs_to :user
  has_many :comments
  acts_as_votable
end
