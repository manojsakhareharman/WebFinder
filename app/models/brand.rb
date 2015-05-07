class Brand < ActiveRecord::Base
  extend FriendlyId
  friendly_id :name

  validates :name, presence: true, uniqueness: true
  validates :url, presence: true, format: { with: URI.regexp }

  has_attached_file :logo,
    styles: {
      large: "250x156",
      medium: "125x78",
      small: "90x57",
      thumb: "83x52",
      thumb_square: "64x64#",
      circle: "72x72",
      tiny: "32x32#"
  }, default_url: "missing/logos/:style.jpg"

  validates_attachment_content_type :logo, content_type: /\Aimage\/.*\Z/

  has_attached_file :white_logo,
    styles: {
      large: "250x156",
      medium: "125x78",
      small: "90x57",
      thumb: "83x52",
      thumb_square: "64x64#",
      circle: "72x72",
      tiny: "32x32#"
  }, default_url: "missing/logos/:style.jpg"

  validates_attachment_content_type :white_logo, content_type: /\Aimage\/.*\Z/

  def self.all_for_site
    order("UPPER(name)")
  end

  def self.for_consultant_portal
    where("downloads_page_url IS NOT NULL AND downloads_page_url != ''").order("UPPER(name)")
  end

  # :nocov:
  def should_generate_new_friendly_id?
    true
  end
  # :nocov:

  def friendly_url
    self.url.to_s.gsub(/^https?\:\/\//, '')
  end
end
