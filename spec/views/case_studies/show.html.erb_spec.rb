require 'rails_helper'

RSpec.describe "case_studies/show.html.erb", :type => :view do

  before do
    @vertical_market = FactoryGirl.create(:vertical_market)
    @case_study = FactoryGirl.create(:case_study, vertical_market: @vertical_market)
    assign(:case_study, @case_study)
    assign(:vertical_market, @vertical_market)
  end

  it "displays the headline" do
    render

    expect(rendered).to have_css("h1", text: @case_study.headline)
  end

  it "displays the body content" do
    render

    expect(rendered).to have_content(@case_study.content)
  end

end

