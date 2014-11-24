class CaseStudy < ActiveRecord::Base
  extend FriendlyId
  friendly_id :name, use: [:slugged, :finders]

  belongs_to :vertical_market

  validate :vertical_market, presence: true

  def slug_candidates
    [
      :name,
      :headline,
      [:name, :headline]
    ]
  end
end
