class VerticalMarketsController < ApplicationController
  respond_to :html, :json

  def show
    @vertical_market = VerticalMarket.find(params[:id])
    respond_with @vertical_market
  end

end
