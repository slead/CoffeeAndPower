class Location < ActiveRecord::Base
  has_many :cafes
  searchkick autocomplete: ['name']
end
