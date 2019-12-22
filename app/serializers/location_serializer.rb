class LocationSerializer
  # see ./app/serializers/bird_serializer.rb for notes on this
  include FastJsonapi::ObjectSerializer
  attributes :latitude, :longitude
end
