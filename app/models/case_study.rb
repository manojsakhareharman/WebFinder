class CaseStudy < ActiveRecord::Base
  extend FriendlyId
  friendly_id :name, use: [:slugged, :finders]

  belongs_to :vertical_market
  has_attached_file :banner,
    styles: {
      large: "1000x624",
      medium: "500x312",
      small: "250x156",
      thumb: "83x52",
      thumb_square: "64x64#"
  }, default_url: "missing/banners/:style.jpg"

  validates_attachment_content_type :banner, content_type: /\Aimage\/.*\Z/
  validates :name, presence: true
  validates :vertical_market, presence: true

  def slug_candidates
    [
      :name,
      :headline,
      [:name, :headline]
    ]
  end
end
