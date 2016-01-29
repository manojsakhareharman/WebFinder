class CreateLandingPages < ActiveRecord::Migration
  def change
    create_table :landing_pages do |t|
      t.string :title
      t.string :subtitle
      t.string :slug
      t.text :main_content
      t.text :left_content
      t.text :right_content
      t.text :sub_content

      t.timestamps null: false
    end
    add_index :landing_pages, :slug
  end
end
