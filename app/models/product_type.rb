class ProductType < ActiveRecord::Base
  extend FriendlyId
  friendly_id :name

  validates :name, presence: true,  uniqueness: true

  # :nocov:
  def should_generate_new_friendly_id?
    true
  end
  # :nocov:

end
