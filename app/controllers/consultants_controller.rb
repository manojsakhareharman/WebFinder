class ConsultantsController < ApplicationController

  def index
    @brands = Brand.for_consultant_portal
  end

  def api_test
    @brands = HTTParty.get "#{api_root}/api/v2/brands.json"
  end

  def api_test_brand
    @brand = HTTParty.get "#{api_root}/api/v2/brands/#{ params[:id] }.json"
    @products = HTTParty.get @brand["products"]
    @software = HTTParty.get @brand["software"]
  end

  def api_test_product
    @product = HTTParty.get "#{api_root}/api/v2/brands/#{ params[:brand_id] }/products/#{ params[:id] }.json"
  end

  private

  def api_root
    Rails.env.production? ? "http://bssaudio.com" : "http://bss.lvh.me:3000"
  end

end
