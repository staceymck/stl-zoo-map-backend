class ExhibitSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :species_fact
  has_one :zone
end
