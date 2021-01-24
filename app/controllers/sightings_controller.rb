class SightingsController < ApplicationController
  def index
    sightings = Sighting.all
    render json: SightingSerializer.new(sightings)
  end

  def show
    sighting = Sighting.find(params[:id])
    options = {
      include: [:bird, :location]
    }
    render json: SightingSerializer.new(sighting, options)
  end
# THIS
#   {
#   "id": 2,
#   "bird_id": 2,
#   "location_id": 2,
#   "created_at": "2019-05-14T11:20:37.228Z",
#   "bird": {
#     "name": "Grackle",
#     "species": "Quiscalus Quiscula"
#   },
#   "location": {
#     "latitude": 30.26715,
#     "longitude": -97.74306
#   }
# }
# BECOMES THIS
# {
#   "data": {
#     "id": "2",
#     "type": "sighting",
#     "attributes": {
#       "created_at": "2019-05-14T16:39:37.011Z"
#     },
#     "relationships": {
#       "bird": {
#         "data": {
#           "id": "2",
#           "type": "bird"
#         }
#       },
#       "location": {
#         "data": {
#           "id": "2",
#           "type": "location"
#         }
#       }
#     }
#   },
#   "included": [{
#       "id": "2",
#       "type": "bird",
#       "attributes": {
#         "name": "Grackle",
#         "species": "Quiscalus Quiscula"
#       }
#     },
#     {
#       "id": "2",
#       "type": "location",
#       "attributes": {
#         "latitude": 30.26715,
#         "longitude": -97.74306
#       }
#     }
#   ]
# }
end
