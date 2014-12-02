ActiveAdmin.register ReferenceSystemProductType do

  permit_params :reference_system_id, :product_type_id, :quantity

  belongs_to :reference_system
end
