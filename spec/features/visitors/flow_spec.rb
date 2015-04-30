require "rails_helper"

feature "Basic visitor flow" do

  before :all do
    @parent_vertical = FactoryGirl.create(:vertical_market)
    @child_vertical = FactoryGirl.create(:vertical_market, parent_id: @parent_vertical.id)
    @reference_system = FactoryGirl.create(:reference_system, vertical_market: @child_vertical)
    @case_study = FactoryGirl.create(:case_study, vertical_market: @child_vertical)
  end

  before :each do
    visit root_path
  end

  # As a casual visitor
  # I want to click on a vertical market
  # So I can navigate to its solutions
  scenario "Visit a parent vertical market page" do
    click_on @parent_vertical.name

    expect(page).to have_link(@child_vertical.name, href: vertical_market_path(@child_vertical))
  end

  # As a casual visitor on a parent vertical market page
  # I want to click through to a child vertical market page
  # So I can find out about the system solutions
  scenario "Visit a child vertical market page" do
    click_on @parent_vertical.name

    click_on @child_vertical.name

    expect(page).to have_link(@reference_system.name, href: vertical_market_reference_system_path(@child_vertical, @reference_system))
    expect(page).to have_link(@case_study.headline, href: vertical_market_case_study_path(@child_vertical, @case_study))
  end

  # As a casual visitor
  # I want to land directly on a reference page
  # So I can learn directly about that system
  scenario "Visit a reference system page" do
    visit vertical_market_reference_system_path(@child_vertical, @reference_system)

    expect(page).to have_content(@reference_system.description)
  end

  # As a casual visitor on a vertical market page which has case studies
  # I want to click on a case study
  # So that I can read about it
  scenario "Visit a case study page" do
    visit vertical_market_path(@child_vertical)

    click_on @case_study.headline

    expect(page).to have_content(@case_study.content)
  end

end
