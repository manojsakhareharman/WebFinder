ActiveAdmin.register ServiceCenter do
  permit_params :name,
    :contact_name,
    :address,
    :city,
    :state,
    :zip,
    :phone,
    :fax,
    :email,
    :website,
    :account_number,
    :active

  # :nocov:
  index do
    column :name
    column :contact_name
    column :city
    column :state
    column :phone
    column :fax
    column :email
    column :website
    column :account_number
    column :active
    actions
  end

  filter :name, as: :string
  filter :active

  form do |f|
    f.inputs do
      f.input :name
      f.input :contact_name
      f.input :address
      f.input :city
      f.input :state
      f.input :zip
      f.input :phone
      f.input :fax
      f.input :email
      f.input :website
      f.input :account_number
      f.input :active
    end
    f.actions
  end
  # :nocov:
end
