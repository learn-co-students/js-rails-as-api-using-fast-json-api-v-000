class SightingSerializer
  # see ./app/serializers/bird_serializer.rb for notes on this
  include FastJsonapi::ObjectSerializer
  # attributes :created_at
  # We can also use attributes to access related objects, adding them alongside
  # normal object attributes:
  # attributes :created_at, :bird, :location

  # Object relationships can be included in serializers in two steps. The first
  # step is that we include the relationships we want to reflect in our
  # serializers. We can do this in the same way that we include them in the
  # models themselves. A sighting, for instance, belongs to a bird and a
  # location, so we can update the serializer to reflect this:
  attributes :created_at
  belongs_to :bird
  belongs_to :location
end
