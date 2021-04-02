class AttractionSerializer < ActiveModel::Serializer
  attributes :id, :name
  has_one :zone
end
