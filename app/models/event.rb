class Event < ActiveRecord::Base
  extend FriendlyId
  friendly_id :slug_candidates

  validates :name, presence: true
  validates :start_on, presence: true
  validates :end_on, presence: true

  has_attached_file :image,
    styles: {
      large: "1000x624#",
      medium: "500x312#",
      medium_gray: { geometry: "500x312#", processors: [:grayscale, :thumbnail] },
      small: "250x156#",
      thumb: "83x52#",
      thumb_square: "64x64#"
  }, default_url: "missing/banners/:style.jpg"

  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/

  def slug_candidates
    [
      :name,
      [:start_on, :name]
    ]
  end

  def should_generate_new_friendly_id?
    true
  end

  def self.current_and_upcoming
    where(active: true).where("end_on >= ?", Date.today).order(start_on: :desc)
  end

  def self.recent
    where(active: true).where("end_on <= ? AND end_on >= ?", Date.today, 6.months.ago).order(start_on: :desc)
  end
end
