class NewsArticle < ActiveRecord::Base
  extend FriendlyId
  friendly_id :slug_candidates

  has_many :brand_news_articles, dependent: :destroy, inverse_of: :news_article
  has_many :brands, through: :brand_news_articles
  belongs_to :locale, class_name: "AvailableLocale", foreign_key: :locale_id

  has_attached_file :news_photo,
    styles: {
      large: "1170x624#",
      medium: "500x312#",
      small: "250x156#",
      thumb: "83x52#",
      thumb_square: "64x64#"
  }, default_url: "missing/banners/:style.jpg"

  validates_attachment_content_type :news_photo, content_type: /\Aimage\/.*\Z/
  validates :locale, presence: true
  validates :title, presence: true
  validates :post_on, presence: true

  accepts_nested_attributes_for :brand_news_articles, reject_if: :all_blank, allow_destroy: true

  # :nocov:
  def slug_candidates
    [
      :title,
      [:title, :locale],
      [:post_on, :title, :locale]
    ]
  end

  def should_generate_new_friendly_id?
    true
  end
  # :nocov:

end
