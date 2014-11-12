class CreateExamples < ActiveRecord::Migration
  def change
    create_table :examples do |t|
      t.string :name
      t.integer :vertical_market_id

      t.timestamps
    end
    add_index :examples, :vertical_market_id
  end
end
