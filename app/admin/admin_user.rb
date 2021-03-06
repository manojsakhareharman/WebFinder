ActiveAdmin.register AdminUser do
  menu parent: "Settings", priority: 2
  permit_params :email, :password, :password_confirmation,
    :service_department, :super_admin, :translator,
    locale_translators_attributes: [:id, :available_locale_id, :_destroy]

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

  controller do
    def update
      if params[:admin_user][:password].blank?
        params[:admin_user].delete("password")
        params[:admin_user].delete("password_confirmation")
      end
      super
    end
  end

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
      f.input :translator
    end
    f.has_many :locale_translators, heading: "Authorized Locales", new_record: "Add an authorized locale" do |s|
      s.input :id, as: :hidden
      s.input :locale
      s.input :_destroy, as: :boolean, label: "Delete"
    end
    f.actions
  end
  # :nocov:

end
