class ExhibitSerializer < ActiveModel::Serializer
  include Rails.application.routes.url_helpers
  attributes :id, :name, :description, :species_fact, :exhibit_image, :zone_id

  #has_one :image
  
  def exhibit_image
    if object.image.attached?
      {
        cloudinary: object.image.service_url
      }
    end
  end
end