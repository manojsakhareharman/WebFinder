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
        resource = HTTParty.get @brand.info_api
        respond_with resource
      }
    end
  end

  def softwares
    @softwares = HTTParty.get @brand.softwares_api
    respond_with @softwares
  end

  private

  def set_brand
    @brand = Brand.find(params[:id])
  end

end
