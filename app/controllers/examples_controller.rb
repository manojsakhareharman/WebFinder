class ExamplesController < ApplicationController
  before_action :load_vertical_market

  def show
    @example = Example.find(params[:id])
  end

  private

  def load_vertical_market
    @vertical_market = VerticalMarket.find(params[:vertical_market_id])
  end
end
