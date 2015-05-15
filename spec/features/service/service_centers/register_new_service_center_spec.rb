require "rails_helper"

feature "Registering to become a service center" do
  include ActiveJob::TestHelper

  before :each do
    clear_enqueued_jobs
    @service_center = FactoryGirl.build(:service_center)

    visit new_service_center_path
  end

  scenario "successfully" do
    perform_enqueued_jobs do
      s_count = ServiceCenter.count

      fill_in "Your Name", with: @service_center.contact_name
      fill_in "Business Name", with: @service_center.name
      fill_in "Address", with: @service_center.address
      fill_in "City", with: @service_center.city
      fill_in "State", with: @service_center.state
      fill_in "Zip", with: @service_center.zip
      fill_in "Phone", with: @service_center.phone
      fill_in "Email", with: @service_center.email
      check "I am willing and able to service all Harman" #...
      click_on "Register"

      service_center = ServiceCenter.last
      expect(page).to have_content "Thank you"
      expect(current_path).to eq service_center_login_path
      expect(service_center.name).to eq @service_center.name
      expect(service_center.active?).to be false
      expect(ServiceCenter.count).to eq(s_count + 1)

      last_email = ActionMailer::Base.deliveries.last
      expect(last_email.to).to include(ENV['service_center_registration_recipient'])
    end
  end

end
