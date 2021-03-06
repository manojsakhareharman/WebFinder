class ReferenceSystem < ActiveRecord::Base
  translates :slug, :name, :description, :headline, :venue_size_descriptor
  extend FriendlyId
  friendly_id :slug_candidates, use: :globalize

  belongs_to :vertical_market
  has_many :reference_system_product_types, dependent: :destroy

  has_attached_file :banner,
    styles: {
      large: "1170x624#",
      medium: "500x312#",
      small: "250x156#",
      thumb: "83x52#",
      thumb_square: "64x64#"
  }, default_url: "missing/banners/:style.jpg"

  has_attached_file :system_diagram,
    styles: {
      large: "635x419",
      thumb_square: "64x64#"
  }, default_url: "missing/system_diagrams/:style.jpg"

  validates_attachment_content_type :banner, content_type: /\Aimage\/.*\Z/
  validates_attachment_content_type :system_diagram, content_type: /\Aimage\/.*\Z/
  validates :name, presence: true
  validates :vertical_market, presence: true
  validates :headline, presence: true

  acts_as_list scope: :vertical_market

  # :nocov:
  def slug_candidates
    [
      :name,
      :headline,
      [:name, :headline]
    ]
  end

  def should_generate_new_friendly_id?
    true
  end
  # :nocov:

  def slider_name
    @slider_name ||= (self.venue_size_descriptor.present?) ? venue_size_descriptor : name
  end
  def previous
    higher_item unless first?
  end

  def next
    lower_item unless last?
  end
end
