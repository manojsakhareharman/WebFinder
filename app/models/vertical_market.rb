class VerticalMarket < ActiveRecord::Base
  extend FriendlyId
  friendly_id :slug_candidates

  has_many :case_studies
  has_many :reference_systems, -> { order("position ASC") }
  acts_as_tree order: "name"

  has_attached_file :banner,
    styles: {
      large: "1000x624#",
      medium: "500x312#",
      small: "250x156#",
      thumb: "83x52#",
      thumb_square: "64x64#"
  }, default_url: "missing/banners/:style.jpg"

  validates_attachment_content_type :banner, content_type: /\Aimage\/.*\Z/
  validates :name, presence: true, uniqueness: true
  validates :headline, presence: true

  def self.parent_verticals
    where("parent_id IS NULL or parent_id <= 0")
  end

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

  def retail?
    reference_systems.where(retail: true).length > 0
  end

  def featured_reference_systems(limit = 6)
    reference_systems.limit(limit)
  end

  def featured_case_studies(limit = 3)
    @featured_case_studies ||= case_studies.order("RAND()").limit(limit)
  end

end
