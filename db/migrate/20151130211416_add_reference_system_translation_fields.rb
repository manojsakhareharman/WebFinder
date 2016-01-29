class AddReferenceSystemTranslationFields < ActiveRecord::Migration
  def up
    ReferenceSystem.create_translation_table!({
      :name => :string,
      :headline => :string,
      :venue_size_descriptor => :string,
      :description => :text,
    }, {
      :migrate_data => true
    })
  end

  def down
    ReferenceSystem.drop_translation_table! :migrate_data => true
  end
end
