class AttractionsController < ApplicationController

  # GET /attractions
  def index
    @attractions = Attraction.all

    render json: @attractions
  end
end
