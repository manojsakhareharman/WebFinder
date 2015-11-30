class AddVerticalMarketTranslationFields < ActiveRecord::Migration
  def up
    VerticalMarket.create_translation_table!({
      :name => :string,
      :headline => :string,
      :description => :text,
    }, {
      :migrate_data => true
    })
  end

  def down
    VerticalMarket.drop_translation_table! :migrate_data => true
  end
end
