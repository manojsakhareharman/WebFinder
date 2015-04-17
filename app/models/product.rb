class Product < ActiveRecord::Base
  extend FriendlyId
  friendly_id :name, use: [:slugged, :finders]

  belongs_to :brand

  has_attached_file :photo,
    styles: {
      large: "1000x624",
      medium: "500x312",
      small: "250x156",
      thumb: "83x52",
      thumb_square: "64x64#",
      tiny: "32x32#"
  }, default_url: "missing/banners/:style.jpg"

  validates_attachment_content_type :photo, content_type: /\Aimage\/.*\Z/
  validates :name, presence: true, uniqueness: true
  validates :brand, presence: true

  def buy_now_url
    @buy_now_url ||= ecommerce_enabled ? (ENV['buy_now_url_template'] % ecommerce_id) : ''
  end

  # No ? at the end because this gets passed as an attribute to js
  def ecommerce_enabled
    !!(ecommerce_id.present?)
  end

  def tiny_photo_url
    self.photo.url(:tiny)
  end

end
