require "rails_helper"

feature "Lead generation" do

  before do
    @vertical_market = FactoryGirl.create(:vertical_market)
    @reference_system = FactoryGirl.create(:reference_system, vertical_market: @vertical_market)
    @help_find_installer = FactoryGirl.create(:site_setting, name: "button-help-find-installer", content: "Help Me Find Installer")
  end

  # As a casual visitor
  # I want to fill out a contact form
  # So that I can be contacted by sales
  scenario "complete installer help form on vertical market page" do
    lead = FactoryGirl.build(:lead, name: "Vertical Market Installer Lead")
    visit vertical_market_path(@vertical_market)

    click_on @help_find_installer.content
    complete_leadgen_form(lead)
    click_on "Submit"

    new_lead = Lead.last
    expect(page).to have_content("Thankyou")
    expect(new_lead.name).to be(lead.name)
    expect(new_lead.source).to be(vertical_market_path(@vertical_market))
  end

  def complete_leadgen_form(lead)
    fill_in "Name", with: lead.name
    fill_in "Company", with: lead.company
    fill_in "Email", with: lead.email
    fill_in "Phone", with: lead.phone
    fill_in "Project Description", with: lead.project_description
  end

end
