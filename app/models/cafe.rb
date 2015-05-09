class Cafe < ActiveRecord::Base

  belongs_to :user
  has_many :comments, dependent: :destroy
  belongs_to :location
  validates_presence_of :name, :address
  acts_as_votable

  # Geocoding
  geocoded_by :address
  reverse_geocoded_by :latitude, :longitude do |obj, results|
    if geo = results.first
      obj.city = geo.city
      obj.state = geo.state
      obj.country = geo.country
    end
  end
  after_validation :geocode, if: :address_changed?
  after_validation :reverse_geocode, if: :address_changed?

  # Friendly IDs in the URL
  extend FriendlyId
  friendly_id :name, :use => :slugged
  
end
