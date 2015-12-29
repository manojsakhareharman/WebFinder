require "rails_helper"

RSpec.describe "cms/available_locales/products/_form.html.erb" do

  before :all do
    @locale = FactoryGirl.create(:available_locale)
    @product = FactoryGirl.create(:product)
  end

  before :each do
    assign(:available_locale, @locale)
    assign(:product, @product)
    render
  end

  it "has the fields" do
    expect(rendered).to have_field 'Name'
    expect(rendered).to have_field 'Description'
    expect(rendered).to have_button "Save Changes"
  end

end
