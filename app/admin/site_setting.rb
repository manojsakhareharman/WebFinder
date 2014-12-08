ActiveAdmin.register SiteSetting do

  permit_params :name, :content

  # :nocov:
  filter :name, as: :string
  # :nocov:

end
