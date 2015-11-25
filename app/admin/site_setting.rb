ActiveAdmin.register SiteSetting do
  menu parent: "Settings", priority: 1

  permit_params :name, :content

  # :nocov:
  filter :name, as: :string
  # :nocov:

end
