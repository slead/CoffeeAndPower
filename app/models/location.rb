class Location < ActiveRecord::Base
  has_many :cafes
  searchkick
end
