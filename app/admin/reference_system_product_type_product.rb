ActiveAdmin.register ReferenceSystemProductTypeProduct do

  permit_params :reference_system_product_type_id, :product_id

  belongs_to :reference_system_product_type

  form do |f|
    f.inputs do
      f.input :reference_system_product_type
      f.input :product, hint: "If you don't see the produt listed, first create it from the main admin screen."
    end
    f.actions
  end
end
