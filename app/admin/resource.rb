ActiveAdmin.register Resource do

  # :nocov:
  permit_params :name, :attachment, :resource_type, :tag_list, :description

  filter :name
  filter :resource_type

  index do
    selectable_column
    column :name
    column :resource_type
    column "Link (right-click to copy URL)" do |r|
      link_to 'attachment', r.attachment.url
    end
    actions
  end

  show do
    attributes_table do
      row :name
      row :resource_type
      row :attachment_file_name
      row :link do
        link_to "#{root_url.to_s.sub(/\/$/, '')}#{resource.attachment.url}", resource.attachment.url, target: "_blank"
      end
      row :attachment_content_type
      row :attachment_file_size do
        number_to_human_size(resource.attachment_file_size)
      end
      row :attachment_updated_at
      row :description
    end
    active_admin_comments
  end

  form html: { multipart: true} do |f|
    f.inputs do
      f.input :name
      f.input :attachment
      f.input :resource_type, hint: "ie, application guide, brochure, etc."
      f.input :description
      f.input :tag_list, label: "Tags", hint: "separated by a comma."
    end
    f.actions
  end
  # :nocov:

end
