class Cafe < ActiveRecord::Base
  
  belongs_to :user
  has_many :comments, dependent: :destroy
  validates_presence_of :name, :address
  acts_as_votable
end
