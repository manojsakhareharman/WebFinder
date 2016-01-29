ActiveAdmin.register SiteSetting do
  menu parent: "Settings", priority: 1

  permit_params :name, :content

  # :nocov:
  index do
    selectable_column
    column :name
    column :content do |s|
      raw(textilize(s.content))
    end
    actions
  end

  filter :name, as: :string

  show do
    attributes_table do
      row :name

      row :content do
        raw(textilize(site_setting.content))
      end
    end
    active_admin_comments
  end
  # :nocov:

end
