ActiveAdmin.register OnlineRetailer do
  menu parent: "Brands/Products", priority: 3
  permit_params :name, :url, :logo

  # :nocov:
  index do
    column :name
    column :url
    actions
  end

  filter :name, as: :string

  form html: {multipart: true} do |f|
    f.inputs do
      f.input :name
      f.input :url,
        placeholder: "http://retailer.website/landing/page",
        hint: "Link directly to HARMAN brands products if retailer provides such a landing page."
      f.input :logo,
        hint: "Please use a PNG with transparent background."
    end
    f.actions
  end
  # :nocov:

end
