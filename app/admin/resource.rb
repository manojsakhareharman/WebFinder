ActiveAdmin.register Resource do

  # :nocov:
  permit_params :name, :attachment, :resource_type, :tag_list

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

  form html: { multipart: true} do |f|
    f.inputs do
      f.input :name
      f.input :attachment
      f.input :resource_type, hint: "ie, application guide, brochure, etc."
      f.input :tag_list, label: "Tags", hint: "separated by a comma."
    end
    f.actions
  end
  # :nocov:

end
