class ProductsController < ApplicationController
  before_action :set_brand
  respond_to :json

  def index
    @products = BrandApi.products @brand.products_api
    respond_with @products
  end

  def show
    @product = BrandApi.product @brand.product_api(params[:id])
    respond_with @product
  end

  private

  def set_brand
    @brand = Brand.find(params[:brand_id])
  end

end
