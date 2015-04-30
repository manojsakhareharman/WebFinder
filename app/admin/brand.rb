ActiveAdmin.register Brand do
  permit_params :name, :url, :logo, :white_logo, :description

  # :nocov:
  index do
    column :name
    column :url
  end

  filter :name, as: :string

  form html: {multipaart: true} do |f|
    f.inputs do
      f.input :name
      f.input :url
      f.input :logo
      f.input :white_logo
      f.input :description
    end
    f.actions
  end
  # :nocov:
end
