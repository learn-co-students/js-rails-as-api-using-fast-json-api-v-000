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
    render json: SightingsSerializer.new(sighting, options)
  end
end
