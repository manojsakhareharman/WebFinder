class AddHeadlineAndCopyToVerticalMarkets < ActiveRecord::Migration
  def change
    add_column :vertical_markets, :headline, :string
    add_column :vertical_markets, :description, :text
  end
end
