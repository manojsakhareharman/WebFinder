class AddBrandTranslationFields < ActiveRecord::Migration
  def up
    Brand.create_translation_table!({
      :description => :text,
      :contact_info_for_consultants => :text
    }, {
      :migrate_data => true
    })
  end

  def down
    Brand.drop_translation_table! :migrate_data => true
  end
end
