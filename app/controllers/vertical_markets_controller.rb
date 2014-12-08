class VerticalMarketsController < ApplicationController

  def show
    @vertical_market = VerticalMarket.find(params[:id])
    respond_to do |format|
      format.html
      format.json { render json: @vertical_market.reference_systems }
    end
  end

end
