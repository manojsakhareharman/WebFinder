class VerticalMarketsController < ApplicationController

  def show
    @vertical_market = VerticalMarket.find(params[:id])
  end
end
