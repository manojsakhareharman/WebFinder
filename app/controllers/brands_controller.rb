class BrandsController < ApplicationController
  before_action :set_brand
  respond_to :html, :json

  def show
    unless @brand.show_on_main_site?
      redirect_to root_path and return false
    end
    respond_to do |format|
      format.html
      format.json {
        resource = BrandApi.info @brand.info_api
        respond_with resource
      }
    end
  end

  # Polls the brand for its software offerings
  def softwares
    @softwares = BrandApi.software @brand.softwares_api
    respond_with @softwares
  end

  private

  def set_brand
    @brand = Brand.find(params[:id])
  end

end
