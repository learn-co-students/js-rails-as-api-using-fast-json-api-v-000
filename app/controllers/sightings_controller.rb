class SightingsController < ApplicationController
# The SightingSerializer.new(sighting) statement can be used on all SightingController actions 
# we want to serialize, so if we were to add an index, 
# for instance, we just pass in the array of all sightings as well:
  def index
    sightings = Sighting.all
    render json: SightingSerializer.new(sightings)
  end

# Original Show Method render json: Statement
  # def show
  #   sighting = Sighting.find(params[:id])
  #   render json: sighting.to_json(:include => {:bird => {:only =>[:name, :species]}, :location => {:only =>[:latitude, :longitude]}}, :except => [:updated_at])
  # end

# To start using the new serializers, we can update our render json: statement 
# so that it initializes the newly created SightingSerializer, passing in a variable
  # def show
  #   sighting = Sighting.find(params[:id])
  #   render json: SightingSerializer.new(sighting)
  # end

#  Now that we have included relationships connecting the SightingSerializer to  :bird and :location, 
# to include attributes from those objects, the recommended method is to pass in a second options 
# parameter to the serializer indicating that we want to include those objects: 
  def show
    sighting = Sighting.find_by(id: params[:id])
    options = {
      include: [:bird, :location]
    }
    render json: SightingSerializer.new(sighting, options)
  end

  
end
