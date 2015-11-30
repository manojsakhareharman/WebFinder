class AddLandingPageTranslationFields < ActiveRecord::Migration
  def up
    LandingPage.create_translation_table!({
      :title => :string,
      :subtitle => :string,
      :description => :string,
      :main_content => :text,
      :left_content => :text,
      :right_content => :text,
      :sub_content => :text
    }, {
      :migrate_data => true
    })
  end

  def down
    LandingPage.drop_translation_table! :migrate_data => true
  end
end
