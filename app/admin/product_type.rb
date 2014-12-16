ActiveAdmin.register ProductType do

  permit_params :name, :description

  menu false

  # :nocov:
  filter :name

  index do
    selectable_column
    column :name
    column :description
    actions
  end

  form do |f|
    f.inputs do
      f.input :name
      f.input :description, hint: "Maximum characters: 90", input_html: { maxlength: 90, rows: 3}
    end
    f.actions
  end
  # :nocov:

end
