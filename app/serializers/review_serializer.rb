class ReviewSerializer < ActiveModel::Serializer
  include Rails.application.routes.url_helpers
  attributes :id, :username, :rating, :content, :review_image, :created_at

  has_one :image

  def review_image
    if object.image.attached?
      {
        cloudinary: object.image.service_url
      }
    end
  end 

  # def date
  #   object.created_at.strftime("%m/%d/%Y")
  # end
end
