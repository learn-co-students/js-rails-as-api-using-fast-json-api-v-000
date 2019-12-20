class SightingsController < ApplicationController


  def show
    sighting = Sighting.find(params[:id])
    options = {
    include: [:bird, :location]}
    # render json: @sighting.to_json(:include => {:bird => {:only =>[:name, :species]}, :location => {:only =>[:latitude, :longitude]}}, :except => [:updated_at])
    render json: SightingSerializer.new(sighting, options)

  end


  def index
    sightings = Sighting.all
    render json: SightingSerializer.new(sightings)
  end


end
