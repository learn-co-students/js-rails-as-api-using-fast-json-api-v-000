class SightingsController < ApplicationController
  def index 
    sightings = Sighting.all 
    render json: SightingSerializer.new(sightings)
  end

  def show
    @sighting = Sighting.find(params[:id])
    opts = {
      include: [:bird, :location]
    }
    render json: SightingSerializer.new(@sighting) 
  end
end