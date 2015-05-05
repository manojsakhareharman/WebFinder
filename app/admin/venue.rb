ActiveAdmin.register Venue do
  permit_params :name, :description, :top, :left

  # :nocov:
  index do
    selectable_column
    column :name
    actions
  end

  form html: { multipart: true} do |f|
    f.inputs do
      f.input :name
      f.input :description, hint: "Maximum characters: 90", input_html: { maxlength: 90, rows: 3}
      f.input :top, hint: "Percent position from the top of the cityscape where the icon should appear.", placeholder: "50%"
      f.input :left, hint: "Percent position from the left side of the cityscape where the icon should appear.", placeholder: "50%"
    end
    f.actions
  end

  filter :name, as: :string

  # :nocov:
end
