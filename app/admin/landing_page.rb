ActiveAdmin.register LandingPage do

  permit_params :title, :subtitle, :description, :main_content, :left_content, :right_content, :sub_content

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

  show do
    attributes_table do
      row :title
      row :subtitle
      row :description
      row :direct_link do
        link_to landing_page_url(landing_page), landing_page_url(landing_page), target: "_blank"
      end

      row :main_content do
        raw(textilize(landing_page.main_content))
      end

      row :left_content do
        raw(textilize(landing_page.left_content))
      end

      row :right_content do
        raw(textilize(landing_page.right_content))
      end

      row :sub_content do
        raw(textilize(landing_page.sub_content))
      end
    end
    active_admin_comments
  end

  form do |f|
    f.inputs do
      f.input :title
      f.input :subtitle
      f.input :description, hint: "appears as meta description in HTML for page"
      f.input :main_content, hint: "textilize and/or html permitted"
      f.input :left_content, hint: "(optional)"
      f.input :right_content, hint: "(optional)"
      f.input :sub_content, hint: "(optional)"
    end
    f.actions
  end
  # :nocov:

end
