class CreateLocaleTranslators < ActiveRecord::Migration
  def change
    create_table :locale_translators do |t|
      t.integer :available_locale_id
      t.integer :admin_user_id

      t.timestamps null: false
    end
    add_index :locale_translators, :available_locale_id
    add_index :locale_translators, :admin_user_id
  end
end
