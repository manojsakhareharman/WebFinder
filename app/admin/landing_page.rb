ActiveAdmin.register LandingPage do
  menu label: "Landing Pages"

  permit_params :title,
    :subtitle,
    :description,
    :main_content,
    :left_content,
    :right_content,
    :sub_content,
    :hide_title,
    :banner,
    :header_code,
    :footer_code

  # :nocov:
  index do
    selectable_column
    column :locale do |lp|
      if lp.original_locale
        lp.original_locale.key
      end
    end
    column :title do |lp|
      if lp.original_locale
        Globalize.with_locale(lp.original_locale.key) do
          lp.title
        end
      else
        lp.title
      end
    end
    column "Link" do |lp|
      if lp.original_locale
        link_to "Direct Link", landing_page_path(lp, locale: lp.original_locale.key), target: "_blank"
      else
        link_to "Direct Link", landing_page_path(lp), target: "_blank"
      end
    end
    column :created_at
    actions
  end

# Can't filter by title since it is Globalized now
#  filter :title, as: :string
  filter :original_locale
  filter :updated_at

  show do
    attributes_table do
      row :banner do |b|
        if b.banner_file_name.present?
          image_tag b.banner.url(:small)
        end
      end
      row :title
      row :hide_title
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

      row :header_code
      row :footer_code
    end
    active_admin_comments
  end

  form html: { multipart: true} do |f|
    f.inputs do
      f.input :title
      f.input :hide_title, label: "Hide big, h1 title tag"
      f.input :subtitle
      f.input :description, hint: "appears as meta description in HTML for page"
      f.input :banner
      f.input :main_content, input_html: { class: "mceEditor"}
      f.input :left_content, hint: "(optional)", input_html: { class: "mceEditor"}
      f.input :right_content, hint: "(optional)", input_html: { class: "mceEditor"}
      f.input :sub_content, hint: "(optional)", input_html: { class: "mceEditor"}
      f.input :header_code, hint: "Javascript, etc. here will load in the page's HTML header"
      f.input :footer_code, hint: "Javascript, etc. here will load just before the page's closing body tag"
    end
    f.actions
  end
  # :nocov:

end
