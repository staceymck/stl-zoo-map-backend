class ExhibitsController < ApplicationController

  # GET /exhibits
  def index
    @exhibits = Exhibit.all.includes(image_attachment: :blob) #avoids n + 1 query

    render json: @exhibits
  end
end
