ActiveAdmin.register Event do
  config.sort_order = 'start_on_desc'

  permit_params :name, :start_on, :end_on, :description, :featured, :active, :image

  # :nocov:
  index do
    column :name
    column :start_on
    column :end_on
    column :featured
    column :active
    actions
  end

  filter :name
  filter :featured
  filter :active
  filter :start_on

  show do
    attributes_table do
      row :name
      row :start_on
      row :end_on
      row :description
      row :image do
        if event.image_file_name.present?
          link_to(image_tag(event.image.url(:small)), event.image.url)
        end
      end
      row :featured
      row :active
    end
  end

  form html: {multipart: true} do |f|
    f.inputs do
      f.input :name
      f.input :start_on, as: :datepicker
      f.input :end_on, as: :datepicker
      f.input :description
      f.input :image, hint: "Only for 'featured' events."
      f.input :featured
      f.input :active
    end
    f.actions
  end
  # :nocov:

end
