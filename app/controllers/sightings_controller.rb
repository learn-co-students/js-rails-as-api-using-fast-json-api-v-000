class SightingsController < ApplicationController
  def show
    # @sighting = Sighting.find(params[:id])
    # render json: @sighting.to_json(:include => {:bird => {:only =>[:name, :species]}, :location => {:only =>[:latitude, :longitude]}}, :except => [:updated_at])

    # To start using the new serializers, we can update our render json:
    # statement so that it initializes the the newly created SightingSerializer,
    # passing in a variable, just as we did when creating our own service class:
    # sighting = Sighting.find(params[:id])
    # render json: SightingSerializer.new(sighting)

    # Setting these relationships up is necessary for the second step. Now that
    # we have included relationships connecting the SightingSerializer to :bird
    # and :location, to include attributes from those objects, the recommended
    # method is to pass in a second options parameter to the serializer
    # indicating that we want to include those objects:
    sighting = Sighting.find_by(id: params[:id])
    options = {
      include: [:bird, :location]
    }
    render json: SightingSerializer.new(sighting, options)

  end
end
