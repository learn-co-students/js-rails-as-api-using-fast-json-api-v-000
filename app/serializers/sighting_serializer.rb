#notes in notes.md

class SightingSerializer
  include FastJsonapi::ObjectSerializer
  attributes :created_at
  belongs_to :bird  
  belongs_to :location
end

=begin
 
The above gets this.

{
  "id": "2",
  "type": "sighting",
  "attributes": {
    "created_at": "2019-05-14T16:39:37.011Z"
  },
  "relationships": {
    "bird": {
      "data": {
        "id": "2",
        "type": "bird"
      }
    },
    "location": {
      "data": {
        "id": "2",
        "type": "location"
      }
    }
  }
}
  
=end
