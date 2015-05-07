class OnlineRetailer < ActiveRecord::Base
  extend FriendlyId
  friendly_id :name

  validates :name, presence: true, uniqueness: true
  validates :url, presence: true, format: { with: URI.regexp }

  has_attached_file :logo,
    styles: {
      large: "1000x624",
      medium: "500x312",
      small: "250x156",
      thumb: "83x52",
      thumb_square: "64x64#",
      circle: "72x72",
      tiny: "32x32#"
  }, default_url: "missing/banners/:style.jpg"

  validates_attachment_content_type :logo, content_type: /\Aimage\/.*\Z/

  def should_generate_new_friendly_id?
    true
  end

end
