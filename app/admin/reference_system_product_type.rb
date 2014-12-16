ActiveAdmin.register ReferenceSystemProductType do

  permit_params :reference_system_id, :product_type_id, :quantity, :top, :left

  belongs_to :reference_system

  # :nocov:
  sidebar "Products", only: [:show, :edit] do
    ul do
      if reference_system_product_type.products.length < 3
        li link_to("+ Add A Product", new_admin_reference_system_product_type_reference_system_product_type_product_path(reference_system_product_type))
      end
      reference_system_product_type.reference_system_product_type_products.each do |rsptp|
        li link_to(rsptp.product.name, [:admin, reference_system_product_type, rsptp])
      end
    end
  end
  form do |f|
    f.inputs do
      f.input :reference_system
      f.input :product_type, hint: "If not listed, create the product type first."
      f.input :quantity
      f.input :top, hint: "Position from the top of the system diagram where the icon should appear.", placeholder: "100px"
      f.input :left, hint: "Position from the left side of the system diagram where the icon should appear.", placeholder: "100px"
    end
    f.actions
  end
  # :nocov:

end
