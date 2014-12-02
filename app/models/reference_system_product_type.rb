class ReferenceSystemProductType < ActiveRecord::Base
  belongs_to :reference_system
  belongs_to :product_type
  has_many :reference_system_product_type_products
  has_many :products, through: :reference_system_product_type_products

  validates :reference_system, presence: true
  validates :product_type, presence: true
end
