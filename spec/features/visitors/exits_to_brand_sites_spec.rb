require 'rails_helper'

feature "Exits to brand sites" do

  before do
    rsptp = FactoryGirl.create(:reference_system_product_type_product)
    @product = rsptp.product
    @brand = @product.brand
    @reference_system_product_type = rsptp.reference_system_product_type
    @product_type = @reference_system_product_type.product_type
    @reference_system = @reference_system_product_type.reference_system
    @reference_system.update_column(:retail, true)
    @vertical_market = @reference_system.vertical_market
  end

  scenario "via reference system products list" do
    visit vertical_market_path(@vertical_market)

    click_on @product_type.name

    expect(page).to have_link(@product.name, href: @product.url)
  end

  scenario "via footer links" do
    visit root_path

    footer = find('.footer')

    expect(footer).to have_link(@brand.name, href: @brand.url)
  end
end
