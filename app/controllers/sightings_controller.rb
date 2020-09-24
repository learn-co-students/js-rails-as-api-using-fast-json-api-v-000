class SightingsController < ApplicationController
  def index
    sightings = Sighting.all
    render json: SightingSerializer.new(sightings)
  end

  def show
    sighting = Sighting.find(params[:id])
    options = { include: %i[bird location] }
    render json: SightingSerializer.new(sighting, options)
  end

  # def show
  #   sighting = Sighting.find_by(id: params[:id])
  #   render json: sighting.to_json(include: {
  #                                   bird: { only: %i[name species] },
  #                                   location: { only: %i[latitude longitude] }
  #                                 }, except: [:updated_at])
  # end
end
