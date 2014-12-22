class MainController < ApplicationController
  def index
    @vertical_markets = VerticalMarket.parent_verticals
  end

  def thankyou
  end
end
