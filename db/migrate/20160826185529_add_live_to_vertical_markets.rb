class AddLiveToVerticalMarkets < ActiveRecord::Migration
  def change
    add_column :vertical_markets, :live, :boolean, default: true
    VerticalMarket.update_all(live: true)
  end

  def remove_column
    remove_column :vertical_markets, :live, :boolean, default: true
  end
end
