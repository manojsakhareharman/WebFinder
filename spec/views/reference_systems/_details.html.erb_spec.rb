require 'rails_helper'

RSpec.describe "reference_systems/_details.html.erb", :type => :view do

  it "displays reference_system headline and description paragraph" do
    @reference_system = FactoryGirl.build_stubbed(:reference_system, description: "Take over the world!")

    render partial: "reference_systems/details", locals: { reference_system: @reference_system }

    expect(rendered).to have_content(@reference_system.description)
    expect(rendered).to have_css("h2", text: @reference_system.headline)
  end

end
