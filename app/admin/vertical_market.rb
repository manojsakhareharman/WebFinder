ActiveAdmin.register VerticalMarket do

  permit_params :name, :parent_id, :headline, :description

  config.sort_order = "parent_id"

  # :nocov:
  index do
    selectable_column
    column :name
    column :parent
    column "Reference Systems" do |v|
      v.reference_systems.length
    end
    actions
  end
  # :nocov:

  filter :parent, as: :select
  filter :name, as: :string
  filter :updated_at

  # :nocov:
  sidebar "Child Verticals", only: [:show, :edit] do
    ul do
      li link_to("+ New Child Vertical Market", new_admin_vertical_market_path)
      vertical_market.children.each do |cv|
        li link_to(cv.name, [:admin, cv])
      end
    end
  end

  sidebar "Reference Systems", only: [:show, :edit] do
    ul do
      unless vertical_market.children.length > 0
        li link_to("+ New Reference System", new_admin_vertical_market_reference_system_path(vertical_market))
      end
      vertical_market.reference_systems.each do |e|
        li link_to(e.name, [:admin, vertical_market, e])
      end
    end
  end
  # :nocov:

end
