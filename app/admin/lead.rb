ActiveAdmin.register Lead do
  menu label: "Leads"
  actions :all, except: [:new, :create]
  permit_params :name, :company, :email, :phone, :project_description, :source, :location

  index do
    id_column
    column :name
    column :company
    column :email
    actions
  end

  sidebar "Settings", only: [:index, :show] do
    "Look for 'lead_recipient' in the Site Settings to configure who receives leads from the site."
  end

  filter :location
  filter :name
  filter :email

end
