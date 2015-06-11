class ProductType < ActiveRecord::Base
  extend FriendlyId
  friendly_id :name

  has_many :reference_system_product_types, dependent: :destroy

  validates :name, presence: true,  uniqueness: true

  # :nocov:
  def should_generate_new_friendly_id?
    true
  end
  # :nocov:

end
