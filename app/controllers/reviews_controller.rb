class ReviewsController < ApplicationController
  before_action :set_review, only: [:show, :update, :destroy]

  # GET /reviews
  # def index
  #   sorted_reviews = Review.applyQuery(params[:q]).includes(image_attachment: :blob)
  #   @reviews = sorted_reviews

  #   paginate json: @reviews, per_page: 10
  # end

  def index
    sorted_reviews = Review.applyQuery(params[:q]).includes(image_attachment: :blob)
    @reviews = sorted_reviews.page(params[:page] ? params[:page].to_i : 1)

    render json: {metadata: pagination_meta(@reviews), reviews: ActiveModel::Serializer::CollectionSerializer.new(@reviews, serializer: ReviewSerializer)}
  end


  # GET /reviews/1
  def show
    render json: @review
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

  # PATCH/PUT /reviews/1
  def update
    if @review.update(review_params)
      render json: @review
    else
      render json: @review.errors, status: :unprocessable_entity
    end
  end

  # DELETE /reviews/1
  def destroy
    @review.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_review
      @review = Review.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
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

    # def page
    #   @page ||= params[:page] || 1
    # end

    # # def per_page
    # #   @per_page ||= params[:per_page] || 10
    # # end

    # def set_pagination_headers 
    #   headers["X-Total-Count"] = @reviews.total_count
      
    #   links = []
    #   links << pg_link(@reviews.next_page, "next") if @reviews.next_page
    #   links << pg_link(@reviews.prev_page, "prev") if @reviews.prev_page
    #   headers["Link"] = links.join(", ") if links.present?
    # end

    # def pg_link(pg, rel)
    #   "<#{reviews_url(request.query_parameters.merge(page: page))}>; rel='#{rel}'"
    # end
end
