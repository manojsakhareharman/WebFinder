class AddSlugToVerticalMarkets < ActiveRecord::Migration
  def change
    add_column :vertical_markets, :slug, :string
    add_index :vertical_markets, :slug, unique: true
  end
end
