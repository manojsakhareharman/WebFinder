ActiveAdmin.register Brand do
  permit_params :name,
    :url,
    :downloads_page_url,
    :support_url,
    :training_url,
    :tech_url,
    :logo,
    :white_logo,
    :description,
    :show_on_main_site,
    :show_on_services_site

  # :nocov:
  index do
    column :name
    column :url
    column :show_on_main_site
    column :show_on_services_site
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
      f.input :tech_url, hint: "Appears on the service center login page if present.", placeholder: "http://tech.brand.com"
      f.input :logo
      f.input :white_logo
      f.input :description
      f.input :show_on_main_site
      f.input :show_on_services_site
    end
    f.actions
  end
  # :nocov:
end
