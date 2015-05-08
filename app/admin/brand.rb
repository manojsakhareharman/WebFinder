ActiveAdmin.register Brand do
  permit_params :name, :url, :downloads_page_url, :support_url, :training_url, :logo, :white_logo, :description

  # :nocov:
  index do
    column :name
    column :url
    actions
  end

  filter :name, as: :string

  form html: {multipaart: true} do |f|
    f.inputs do
      f.input :name
      f.input :url, placeholder: "http://brand.name.com"
      f.input :downloads_page_url, hint: "If present, causes this brand to appear on consultant portal page.", placeholder: "http://brand.name.com/downloads"
      f.input :support_url, hint: "If present, appears on contacts page", placeholder: "http://brand.name.com/support"
      f.input :training_url, hint: "If present, appears on the training page.", placeholder: "http://brand.name.com/training"
      f.input :logo
      f.input :white_logo
      f.input :description
    end
    f.actions
  end
  # :nocov:
end
