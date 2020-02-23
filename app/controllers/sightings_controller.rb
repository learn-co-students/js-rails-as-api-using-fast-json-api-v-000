class SightingsController < ApplicationController
  
  def index
    sightings = Sighting.all
    render json: SightingSerializer.new(sightings)
  end  
  
  def show
    options = {
      include: [:bird, :location]
    }
    render json: SightingSerializer.new(sighting, options)
  end
  
end