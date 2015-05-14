require "rails_helper"

feature "Registering to become a service center" do
  include ActiveJob::TestHelper

  before :each do
    clear_enqueued_jobs
    @service_center = FactoryGirl.build(:service_center)

    visit new_service_center_path
  end

  scenario "successfully" do
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

    expect(enqueued_jobs.size).to eq(1)
    puts "#{enqueued_jobs.first[:args]}"
    last_email = perform_enqueued_jobs do
      ActionMailer::DeliveryJob.perform_now(*enqueued_jobs.first[:args])
    end
    expect(enqueued_jobs.size).to eq(0)

    service_center = ServiceCenter.last
    expect(page).to have_content "Thank you"
    expect(current_path).to eq service_center_login_path
    expect(service_center.name).to eq @service_center.name
    expect(service_center.active?).to be false
    expect(ServiceCenter.count).to eq(s_count + 1)
    expect(last_email.to).to eq(ENV['service_center_registration_recipient'])
    expect(last_email.body).to have_content(@service_center.name)
  end

  #def last_email
  #  ActionMailer::Base.deliveries.last
  #end

end
