class CreateBrandNewsArticles < ActiveRecord::Migration
  def change
    create_table :brand_news_articles do |t|
      t.integer :brand_id
      t.integer :news_article_id

      t.timestamps null: false
    end
    add_index :brand_news_articles, :brand_id
    add_index :brand_news_articles, :news_article_id
  end
end
