class ReviewSerializer < ActiveModel::Serializer
  attributes :id, :username, :rating, :content
end
