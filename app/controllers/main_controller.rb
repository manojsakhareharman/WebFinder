class MainController < ApplicationController
  def index
    @vertical_markets = VerticalMarket.parent_verticals
  end
end
