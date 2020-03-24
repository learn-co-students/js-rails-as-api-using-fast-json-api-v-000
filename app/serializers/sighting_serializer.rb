class SightingSerializer
  include FastJsonapi::ObjectSerializer
  attributes :create_at, :bird, :location
end
