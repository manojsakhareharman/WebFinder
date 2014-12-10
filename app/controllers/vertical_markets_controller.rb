class VerticalMarketsController < ApplicationController

  def show
    @vertical_market = VerticalMarket.find(params[:id])
    if @vertical_market.children.length > 0
      @reference_systems = []
    else
      @reference_systems = @vertical_market.featured_reference_systems
    end
    respond_to do |format|
      format.html
      format.json { render json: @reference_systems }
    end
  end

end
