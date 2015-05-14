class Brand < ActiveRecord::Base
  extend FriendlyId
  friendly_id :name

  validates :name, presence: true, uniqueness: true
  validates :url, presence: true, format: { with: URI.regexp }
  validates :support_url, format: { with: URI.regexp }, allow_blank: true
  validates :downloads_page_url, format: { with: URI.regexp }, allow_blank: true
  validates :training_url, format: { with: URI.regexp }, allow_blank: true
  validates :tech_url, format: { with: URI.regexp }, allow_blank: true

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
    where(show_on_main_site: true).order("UPPER(name)")
  end

  def self.for_consultant_portal
    where(show_on_main_site: true).where("downloads_page_url IS NOT NULL AND downloads_page_url != ''").order("UPPER(name)")
  end

  def self.for_service_site
    where(show_on_services_site: true).order("UPPER(name)")
  end

  def first_name
    self.name.split(/\s/).first
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
