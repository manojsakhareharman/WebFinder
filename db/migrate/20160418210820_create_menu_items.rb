class CreateMenuItems < ActiveRecord::Migration
  def change
    create_table :menu_items do |t|
      t.integer :locale_id
      t.string :title
      t.string :link
      t.boolean :new_tab
      t.boolean :enabled
      t.integer :position

      t.timestamps null: false
    end
    add_index :menu_items, :locale_id
  end
end
