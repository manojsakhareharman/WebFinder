require "rails_helper"

feature "Sure route test object is fetched" do

  before :all do
    @brand = FactoryGirl.create(:brand)
    @vertical_market = FactoryGirl.create(:vertical_market)
    @reference_system = FactoryGirl.create(:reference_system, vertical_market: @vertical_market)
    @case_study = FactoryGirl.create(:case_study, vertical_market: @vertical_market)
  end

  # Setting up /sureroute-test-object.html for akamai
  scenario "successfully" do
    visit "/sureroute-test-object.html"

    expect(current_path).to eq sureroute_test_object_path(format: :html)
    expect(page).to have_content "success"
  end

end
