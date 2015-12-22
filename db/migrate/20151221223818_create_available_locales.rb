class CreateAvailableLocales < ActiveRecord::Migration
  def change
    create_table :available_locales do |t|
      t.string :name
      t.string :key

      t.timestamps null: false
    end
    add_index :available_locales, :key
  end
end
