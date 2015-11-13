ActiveAdmin.register LandingPage do

  permit_params :title, :subtitle, :main_content, :left_content, :right_content, :sub_content

  # :nocov:
  index do
    selectable_column
    column :title
    column "Link" do |lp|
      link_to "Direct Link", landing_page_path(lp), target: "_blank"
    end
    column :created_at
    actions
  end

  filter :title, as: :string
  filter :updated_at

  form do |f|
    f.inputs do
      f.input :title
      f.input :subtitle
      f.input :main_content, hint: "textilize and/or html permitted"
      f.input :left_content, hint: "(optional)"
      f.input :right_content, hint: "(optional)"
      f.input :sub_content, hint: "(optional)"
    end
    f.actions
  end
  # :nocov:

end
