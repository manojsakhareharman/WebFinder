class CreateNewsArticles < ActiveRecord::Migration
  def change
    create_table :news_articles do |t|
      t.integer :locale_id
      t.string :title
      t.text :body
      t.text :keywords
      t.date :post_on
      t.string :news_photo_file_name
      t.string :news_photo_content_type
      t.integer :news_photo_file_size
      t.datetime :news_photo_updated_at
      t.text :quote
      t.string :slug

      t.timestamps null: false
    end
    add_index :news_articles, :locale_id
  end
end
