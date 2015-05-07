require "rails_helper"

RSpec.describe "layouts/application.html.erb", as: :view do

  before :all do
    @brand = FactoryGirl.create(:brand)
  end

  before :each do
    allow(view).to receive(:all_brands).and_return([@brand])

    render
  end

  describe "header" do
    it "has logo in top nav" do
      expect(rendered).to have_css("img[@src='/assets/harman-logo.png']")
    end
  end

  describe "footer" do
    it "links to brands" do
      expect(rendered).to have_link(@brand.name, href: brand_path(@brand))
    end

  end

end
