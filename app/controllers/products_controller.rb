class ProductsController < ApplicationController
  before_action :set_brand
  respond_to :json

  def index
    @products = HTTParty.get @brand.products_api
    respond_with @products
  end

  def show
    @product = HTTParty.get @brand.product_api(params[:id])
    respond_with @product
  end

  private

  def set_brand
    @brand = Brand.find(params[:brand_id])
  end

end
