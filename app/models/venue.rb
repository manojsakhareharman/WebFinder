class Venue < ActiveRecord::Base
  extend FriendlyId
  friendly_id :name

  validates :name, presence: true, uniqueness: true

  def should_generate_new_friendly_id?
    true
  end
end
