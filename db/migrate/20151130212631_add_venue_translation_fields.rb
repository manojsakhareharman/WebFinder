class AddVenueTranslationFields < ActiveRecord::Migration
  def up
    Venue.create_translation_table!({
      :name => :string,
      :description => :text,
    }, {
      :migrate_data => true
    })
  end

  def down
    Venue.drop_translation_table! :migrate_data => true
  end
end
