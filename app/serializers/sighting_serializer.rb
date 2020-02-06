class SightingSerializer
  include FastJsonapi::ObjectSerializer
  attributes
  belongs_to :bird
  belongs_to :location
end
