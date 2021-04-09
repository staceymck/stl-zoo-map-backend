class ZonesController < ApplicationController
  
  # GET /zones
  def index
    @zones = Zone.all

    render json: @zones
  end
end
