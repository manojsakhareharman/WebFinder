ActiveAdmin.register Brand do
  permit_params :name, :url

  filter :name, as: :string

end
