require "rails_helper"

RSpec.describe "consultants/index.html.erb", as: :view do

  before :all do
    @brand1 = FactoryGirl.create(:brand, api_url: "http://foo.com/", contact_info_for_consultants: "Joe Johnson @ 555-5555")
    @brand2 = FactoryGirl.create(:brand, downloads_page_url: "http://foo2.com")
    assign(:brands, [@brand1, @brand2])
    assign(:brands_with_contact_info, [@brand1])
  end

  before :each do
    expect(SiteSetting).to receive(:value).with("consultant-portal-welcome-paragraph").and_return("WELCOME PARAGRAPH")
    expect(SiteSetting).to receive(:value).with("harman_professional_consultant_contact_info").and_return("HARMAN CONTACTS")
    expect(SiteSetting).to receive(:exists?).and_return(true)

    render
  end

  it "has select form for ajax to fill with products" do
    expect(rendered).to have_css("form[@data-brand-id='#{ @brand1.to_param }']")
  end

  it "has a link to downloads page for non-api brands" do
    expect(rendered).to have_link("#{@brand2.name} website", href: @brand2.downloads_page_url)
  end

  it "has brand contact info box" do
    expect(rendered).to have_css("img[@alt='#{ @brand1.name }']")
    expect(rendered).to have_content @brand1.contact_info_for_consultants
  end

  it "doesn't have brand contact box where brand contact is not provided" do
    expect(rendered).not_to have_css("img[@alt='#{ @brand2.name }']")
  end

  it "has welcome paragraph" do
    expect(rendered).to have_content "WELCOME PARAGRAPH"
  end

  it "has contact info for harman pro" do
    expect(rendered).to have_content "HARMAN CONTACTS"
  end
end
