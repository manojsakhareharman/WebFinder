require "rails_helper"

RSpec.describe "cms/available_locales/menu_items/index.html.erb" do
  before :all do
    @locale = FactoryGirl.create(:available_locale)
  end

  before :each do
    assign(:available_locale, @locale)
    render
  end

  it "links to create menu item" do
    expect(rendered).to have_link("Add menu item",
                                  href: new_cms_available_locale_menu_item_path(@locale))
  end
end
