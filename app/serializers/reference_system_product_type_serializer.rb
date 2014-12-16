class ReferenceSystemProductTypeSerializer < ActiveModel::Serializer
  attributes :id, :top, :left, :quantity, :name, :description, :products

  has_many :products

  def name
    object.product_type.name
  end

  def description
    object.product_type.description
  end

end
