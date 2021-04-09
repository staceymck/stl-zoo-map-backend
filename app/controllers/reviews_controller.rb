class ReviewsController < ApplicationController

  # GET /reviews
  def index
    sorted_reviews = Review.applyQuery(params[:q]).includes(image_attachment: :blob)
    @reviews = sorted_reviews.page(params[:page] ? params[:page].to_i : 1)

    render json: {metadata: pagination_meta(@reviews), reviews: ActiveModel::Serializer::CollectionSerializer.new(@reviews, serializer: ReviewSerializer)}
  end

  # POST /reviews
  def create
    @review = Review.new(review_params)

    if @review.save
      render json: @review, status: :created, location: @review
    else
      render json: @review.errors, status: :unprocessable_entity
    end
  end

  private
    def review_params
      params.require(:review).permit(:username, :rating, :content, :image)
    end

    def pagination_meta(obj) 
      {
        current_page: obj.current_page,
        next_page: obj.next_page,
        prev_page: obj.prev_page,
        total_pages: obj.total_pages
      }
    end
end
