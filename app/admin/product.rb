ActiveAdmin.register Product do
  permit_params :name, :brand_id, :url, :photo, :description

  # :nocov:
  form html: { multipart: true} do |f|
    f.inputs do
      f.input :brand
      f.input :name
      f.input :photo
      f.input :url, hint: "Start with http://"
      f.input :description, hint: "Maximum characters: 90", input_html: { maxlength: 90, rows: 3}
    end
    f.actions
  end

  sidebar "Product Types", only: :index do
    ul do
      li link_to("+ New Product Type", new_admin_product_type_path)
      ProductType.all.each do |product_type|
        li link_to(product_type.name, [:admin, product_type])
      end
    end
  end

  filter :brand, as: :select
  filter :name, as: :string

  # :nocov:
end
