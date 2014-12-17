class ReferenceSystemsController < ApplicationController
  respond_to :html, :json
  before_action :load_vertical_market

  def show
    @reference_system = ReferenceSystem.find(params[:id])
    respond_with @vertical_market, @reference_system
  end

  private

  def load_vertical_market
    @vertical_market = VerticalMarket.find(params[:vertical_market_id])
  end
end
