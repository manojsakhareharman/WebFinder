class ReferenceSystemSerializer < ActiveModel::Serializer
  attributes :id, :name, :headline, :description, :banner_url, :slider_name, :system_diagram_url

  def banner_url
    ActionController::Base.helpers.asset_path object.banner.url(:large)
  end

  def system_diagram_url
    ActionController::Base.helpers.asset_path object.system_diagram.url(:large)
  end
end
