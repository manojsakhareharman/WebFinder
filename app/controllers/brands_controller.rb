class BrandsController < ApplicationController

  def show
    @brand = Brand.find(params[:id])
    unless @brand.show_on_main_site?
      redirect_to root_path and return false
    end
  end

end
