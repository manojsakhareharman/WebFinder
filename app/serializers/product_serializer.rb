class ProductSerializer < ActiveModel::Serializer
  attributes :id, :name, :url, :tiny_photo_url, :buy_now_url, :ecommerce_enabled

  def tiny_photo_url
    ActionController::Base.helpers.asset_path object.photo.url(:tiny)
  end

  # Alias of product.ecommerce_enabled? (alias without the ?)
  def ecommerce_enabled
    object.ecommerce_enabled?
  end
end
