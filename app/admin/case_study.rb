ActiveAdmin.register CaseStudy do

  # :nocov:
  permit_params :headline, :description, :content, :banner

  belongs_to :vertical_market

  config.paginate = false
  #config.sort_order = 'name_asc'

  filter :vertical_market
  #filter :headline

  index do
    selectable_column
    column :headline
    column :vertical_market
    actions
  end

  form html: { multipart: true} do |f|
    f.inputs do
      f.input :vertical_market
      f.input :banner, hint: "Preferred size: 1000x624 px with a strongly horizontal orientation."
      f.input :headline, hint: "Maximum characters: 40", input_html: { maxlength: 40 }
      f.input :description, hint: "Maximum characters: 60", input_html: { maxlength: 60, rows: 5 }
      f.input :content, input_html: { rows: 15 }
    end
    f.actions
  end
  # :nocov:

end

