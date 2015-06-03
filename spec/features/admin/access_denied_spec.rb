require "rails_helper"

feature "Access is denied to non-admins" do

  scenario "when not logged in, redirected to login page" do
    visit "/admin"

    expect(current_path).to eq(new_admin_user_session_path)
  end
end
