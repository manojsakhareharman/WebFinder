require "rails_helper"

RSpec.describe "cms/available_locales/site_settings/_form.html.erb" do

  before :all do
    @locale = FactoryGirl.create(:available_locale)
    @site_setting = FactoryGirl.create(:site_setting)
  end

  before :each do
    assign(:available_locale, @locale)
    assign(:site_setting, @site_setting)
    render
  end

  it "has the fields" do
    expect(rendered).to have_field 'Content'
    expect(rendered).to have_button "Save Changes"
  end

end
