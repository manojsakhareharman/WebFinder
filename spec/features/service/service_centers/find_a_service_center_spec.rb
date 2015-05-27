require "rails_helper"

feature "Find a service center" do

  before :all do
    @service_center = FactoryGirl.create(:service_center)
  end

  before :each do
    visit service_centers_path
  end

  scenario "by state" do
    select @service_center.state, from: "Select your US state"
    click_on "Search"

    expect(page).to have_content(@service_center.name)
  end
end
