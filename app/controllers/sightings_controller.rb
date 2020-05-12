class SightingsController < ApplicationController
  def show
    sighting = Sighting.find(params[:id])
    #render json: sighting.to_json(:include => {:bird => {:only =>[:name, :species]}, :location => {:only =>[:latitude, :longitude]}}, :except => [:updated_at])
    #render json: SightingSerializer.new(sighting)
    options = {
    include: [:bird, :location]
  }
  render json: SightingSerializer.new(sighting, options)
  end
end

#With just three objects and some minor customization, rendering has become complicated. With Fast JSON API, we can extract and separate this work into Serializer classes, keeping our controller cleaner.
#a serializer is like helper methods or a module, it dries it and the Fast JSON API
#is the best JSON serializer for RAILS APIS