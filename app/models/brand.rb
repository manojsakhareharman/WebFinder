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
    where(show_on_consultant_page: true).order("UPPER(name)")
  end

  def self.for_consultant_portal_with_contacts
    for_consultant_portal.where("contact_info_for_consultants IS NOT NULL and contact_info_for_consultants != ''")
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

  # Get URL where all products can be retrieved
  def products_api(format = :json)
    #HTTParty.get(self.info_api(format))["products"]
    "#{ api_root }/products.#{ format.to_s }"
  end

  # Get URL where single product can be retrieved
  def product_api(product_id, format = :json)
    "#{ api_root }/products/#{ product_id }.#{ format.to_s }"
  end

  # Get URL for software list
  def softwares_api(format = :json)
    "#{ api_root }/softwares.#{ format.to_s }"
  end

  def info_api(format = :json)
    "#{api_root}.#{ format.to_s }"
  end

  private

  def api_root
    self.api_url.present? ? self.api_url : "http://#{ENV['brands_api_host']}/api/v2/brands/#{ self.friendly_id }"
  end
end
