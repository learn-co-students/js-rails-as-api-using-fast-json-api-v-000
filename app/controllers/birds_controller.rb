class BirdsController < ApplicationController

  def show
    bird = Bird.find_by(id: params["id"])
    render json: BirdSerializer.new(bird)
  end
end
