class SightingSerializer
  include FastJsonapi::ObjectSerializer
  # attributes :created_at, :bird, :location # These will be listed in the same order defined here.
  attribute :created_at # Useful for ONE attribute
  belongs_to :bird
  belongs_to :location

  # If no attributes are specified, then running:
  # render json: SightingSerializer.new(sighting)
  # from the SightingsController's #show action will render (e.g.):
  # {"data": {"id": "2", "type": "sighting"}}
end
