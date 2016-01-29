require "rails_helper"

RSpec.describe "cms/available_locales/reference_systems/_form.html.erb" do

  before :all do
    @locale = FactoryGirl.create(:available_locale)
    @reference_system = FactoryGirl.create(:reference_system)
  end

  before :each do
    assign(:available_locale, @locale)
    assign(:reference_system, @reference_system)
    render
  end

  it "has the fields" do
    expect(rendered).to have_field 'Name'
    expect(rendered).to have_field 'Description'
    expect(rendered).to have_field "Headline"
    expect(rendered).to have_field "Venue size descriptor"
    expect(rendered).to have_button "Save Changes"
  end

end
