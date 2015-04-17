class ProductSerializer < ActiveModel::Serializer
  attributes :id, :name, :url, :tiny_photo_url, :buy_now_url, :ecommerce_enabled
end
