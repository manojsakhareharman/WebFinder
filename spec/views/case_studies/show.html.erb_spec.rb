require 'rails_helper'

RSpec.describe "case_studies/show.html.erb", :type => :view do

  before :all do
    @vertical_market = FactoryGirl.create(:vertical_market)
    @case_study = FactoryGirl.create(:case_study, vertical_market: @vertical_market)
    assign(:case_study, @case_study)
    assign(:vertical_market, @vertical_market)
  end

  before :each do
    render
  end

  it "displays the headline" do
    expect(rendered).to have_css("h1", text: @case_study.headline)
  end

  it "displays the body content" do
    expect(rendered).to have_content(@case_study.content)
  end

  it "displays the banner image" do
    expect(rendered).to have_css("img[@src='#{@case_study.banner.url(:large)}']")
  end

end

