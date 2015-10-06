require "rails_helper"

RSpec.describe "events/show.html.erb", as: :view do

  before :all do
    @current_event = FactoryGirl.create(:event,
                                        start_on: 2.days.ago,
                                        end_on: 2.days.from_now,
                                        featured: true,
                                        image: File.new(Rails.root.join('spec','fixtures','test.jpg')),
                                        active: true)
  end

  before do
    assign(:event, @current_event)
    render
  end

  it "has event content" do
    expect(rendered).to have_content @current_event.name
    expect(rendered).to have_content @current_event.description
  end

  it "has featured event content" do
    expect(rendered).to have_xpath("//img[@src='#{ @current_event.image.url(:large) }']")
  end
end
