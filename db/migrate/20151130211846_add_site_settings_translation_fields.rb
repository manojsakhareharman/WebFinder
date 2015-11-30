class AddSiteSettingsTranslationFields < ActiveRecord::Migration
  def up
    SiteSetting.create_translation_table!({
      :content => :text,
    }, {
      :migrate_data => true
    })
  end

  def down
    SiteSetting.drop_translation_table! :migrate_data => true
  end
end
