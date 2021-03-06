require 'rails_helper'

RSpec.describe "artists/show.html.erb", type: :view do

  before :all do
    @artist = FactoryGirl.build_stubbed(:artist)
  end

  before do
    assign(:artist, @artist)
    render
  end

  it "shows artist details" do
    expect(rendered).to have_content(@artist.description)
    expect(rendered).to have_content(@artist.name)
    expect(rendered).to have_xpath("//img[@src='#{ @artist.photo.url(:large) }']")
  end
end
