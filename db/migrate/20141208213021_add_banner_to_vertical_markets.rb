class AddBannerToVerticalMarkets < ActiveRecord::Migration
  def change
    add_attachment :vertical_markets, :banner
  end
end
