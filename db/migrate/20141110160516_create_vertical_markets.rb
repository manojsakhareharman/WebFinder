class CreateVerticalMarkets < ActiveRecord::Migration
  def change
    create_table :vertical_markets do |t|
      t.string :name
      t.integer :parent_id

      t.timestamps
    end
    add_index :vertical_markets, :parent_id
  end
end
