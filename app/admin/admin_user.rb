ActiveAdmin.register AdminUser do
  menu parent: "Settings", priority: 2
  permit_params :email, :password, :password_confirmation, :service_department, :super_admin

  #menu if: proc { current_admin_user.can?(:manage, AdminUser) }

  # :nocov:
  index do
    selectable_column
    id_column
    column :email
    column :current_sign_in_at
    column :sign_in_count
    column :created_at
    actions
  end
  # :nocov:

  filter :email
  filter :current_sign_in_at
  filter :sign_in_count
  filter :created_at

  # :nocov:
  form do |f|
    f.inputs "Admin Details" do
      f.input :email
      f.input :password
      f.input :password_confirmation
    end
    f.inputs "Roles" do
      f.input :service_department
      f.input :super_admin
    end
    f.actions
  end
  # :nocov:

end
