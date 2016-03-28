class LandingPage < ActiveRecord::Base
  translates :slug, :title, :subtitle, :main_content, :left_content, :right_content, :sub_content, :description
  extend FriendlyId
  friendly_id :title, use: :globalize

  has_attached_file :banner,
    styles: {
      large: "1000x624",
      medium: "500x312",
      small: "250x156",
      thumb: "83x52",
      thumb_square: "64x64#"
  }, default_url: "missing/banners/:style.jpg"

  validates :title, presence: true
  validates :main_content, presence: true

  def side_column_width
    3
  end

  def main_content_width
    mcw = 12
    mcw -= side_column_width if self.left_content.present?
    mcw -= side_column_width if self.right_content.present?
    mcw
  end
end
