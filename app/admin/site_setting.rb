ActiveAdmin.register SiteSetting do

  permit_params :name, :content

  filter :name, as: :string
end
