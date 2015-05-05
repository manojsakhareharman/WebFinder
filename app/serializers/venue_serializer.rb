class VenueSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :left, :top
end
