class VerticalMarket < ActiveRecord::Base
  extend FriendlyId
  friendly_id :name, use: [:slugged, :finders]

  has_many :case_studies
  has_many :reference_systems, -> { order("position ASC") }
  acts_as_tree order: "name"
  validates :name, presence: true, uniqueness: true
  validates :headline, presence: true

  def self.parent_verticals
    where("parent_id IS NULL or parent_id <= 0")
  end

  def slug_candidates
    [
      :name,
      :headline,
      [:name, :headline]
    ]
  end

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
