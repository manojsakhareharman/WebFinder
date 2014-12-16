class ReferenceSystemSerializer < ActiveModel::Serializer
  attributes :id, :name, :headline, :description, :banner_url, :api_url, :slider_name, :system_diagram_url, :reference_system_product_types

  has_many :reference_system_product_types

  def banner_url
    ActionController::Base.helpers.asset_path object.banner.url(:large)
  end

  def system_diagram_url
    ActionController::Base.helpers.asset_path object.system_diagram.url(:large)
  end

  def api_url
    vertical_market_reference_system_path(object.vertical_market, object, format: :json)
  end
end
