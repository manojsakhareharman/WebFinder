class AddProductTypeTranslationFields < ActiveRecord::Migration
  def up
    ProductType.create_translation_table!({
      :name => :string,
      :description => :text,
    }, {
      :migrate_data => true
    })
  end

  def down
    ProductType.drop_translation_table! :migrate_data => true
  end
end
