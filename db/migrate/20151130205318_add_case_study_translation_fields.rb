class AddCaseStudyTranslationFields < ActiveRecord::Migration
  def up
    CaseStudy.create_translation_table!({
      :headline => :string,
      :description => :text,
      :content => :text
    }, {
      :migrate_data => true
    })
  end

  def down
    CaseStudy.drop_translation_table! :migrate_data => true
  end
end
