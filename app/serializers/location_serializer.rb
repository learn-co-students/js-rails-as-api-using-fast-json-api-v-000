class LocationSerializer
  include FastJsonapi::ObjectSerializer
  attributes :latitude, :longitude
  has_many :sightings
end
