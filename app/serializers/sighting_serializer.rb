class SightingSerializer
  include FastJsonapi::ObjectSerializer
  attributes :created_at, :bird
  belongs_to :bird
  belongs_to :location
end
