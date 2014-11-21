ActiveAdmin.register ReferenceSystem do

  # :nocov:
  permit_params :name, :position, :description, :vertical_market_id, :retail,
    :venue_size_descriptor, :headline, :banner

  belongs_to :vertical_market

  config.paginate = false
  config.sort_order = 'position_asc'

  sortable

  index do
    sortable_handle_column
    selectable_column
    column :name
    column :vertical_market
    actions
  end

  form do |f|
    f.inputs do
      f.input :vertical_market
      f.input :name, input_html: { maxlength: 20 }
      f.input :banner
      f.input :venue_size_descriptor, input_html: { maxlength: 16 }
      f.input :headline, input_html: { maxlength: 90 }
      f.input :description, input_html: { maxlength: 650, rows: 6 }
      f.input :retail, label: "Offer ecommerce links with this system."
    end
    f.actions
  end
  # :nocov:

end
