class ReviewSerializer < ActiveModel::Serializer
  include Rails.application.routes.url_helpers
  attributes :id, :username, :rating, :content, :review_image

  def review_image
    if object.image.attached?
      {
        cloudinary: object.image.service_url
      }
    end
  end 
end
