class SightingsController < ApplicationController

	def method_name
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

end
