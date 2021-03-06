# Feature: Home page
#   As a visitor
#   I want to visit a home page
#   So I can learn more about the website
feature 'Service landing page' do

  before do
    visit service_path
  end

  # Scenario: Visit the home page
  #   Given I am a visitor
  #   When I visit the home page
  #   Then I see relevant sections
  scenario 'click through to warranty registrion page' do
    click_on 'Register Now'

    expect(current_url).to match(ENV['warranty_registration_url'])
  end

  scenario 'click through to begin warranty repair process' do
    click_on 'Start Your Repair'

    expect(current_url).to match(ENV['warranty_repair_url'])
  end

  scenario 'click through to begin out-of-warranty repair' do
    click_on 'Get Started'

    expect(current_url).to match(ENV['warranty_repair_url'])
  end

  scenario 'click through to dealer portal' do
    click_on 'Order Now'

    expect(current_url).to match(ENV['dealer_portal_url'])
  end

  scenario 'find a service center' do
    click_on "Find a Service Center"

    expect(current_path).to eq service_centers_path
  end

end
