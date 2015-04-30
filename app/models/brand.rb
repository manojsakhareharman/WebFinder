class Brand < ActiveRecord::Base
  extend FriendlyId
  friendly_id :name

  validates :name, presence: true, uniqueness: true
  validates :url, presence: true

  has_attached_file :logo,
    styles: {
      large: "1000x624",
      medium: "500x312",
      small: "250x156",
      thumb: "83x52",
      thumb_square: "64x64#",
      circle: "48x48#",
      tiny: "32x32#"
  }, default_url: "missing/banners/:style.jpg"

  validates_attachment_content_type :logo, content_type: /\Aimage\/.*\Z/

  has_attached_file :white_logo,
    styles: {
      large: "1000x624",
      medium: "500x312",
      small: "250x156",
      thumb: "83x52",
      thumb_square: "64x64#",
      circle: "48x48#",
      tiny: "32x32#"
  }, default_url: "missing/banners/:style.jpg"

  validates_attachment_content_type :white_logo, content_type: /\Aimage\/.*\Z/

  def self.all_for_site
    order("UPPER(name)")
  end

  # :nocov:
  def should_generate_new_friendly_id?
    true
  end
  # :nocov:

end
