require "rails_helper"

RSpec.describe "main/sitemap.xml.builder", as: :view do

  before :all do
    pages = []
    pages << { url: "http://foo.com",
      updated_at: 1.day.ago,
      changefreq: 'daily',
      priority: 1
    }

    assign(:pages, pages)
  end

  before :each do
    render
  end

  it "links to the homepage" do
    expect(rendered).to have_selector("loc", text: "http://foo.com")
  end
end
