# Serializers  - we must always specify what attributes we want to include.
# class SightingSerializer
#   include FastJsonapi::ObjectSerializer
#   attributes :created_at
# end

# We can also use attributes to access related objects, adding them alongside normal object attributes:
# class SightingSerializer
#   include FastJsonapi::ObjectSerializer
#   attributes :created_at, :bird, :location
# end

# The first step is that we include the relationships we want to reflect in our serializers. 
  class SightingSerializer
    include FastJsonapi::ObjectSerializer
    attributes :created_at
    belongs_to :bird
    belongs_to :location
  end