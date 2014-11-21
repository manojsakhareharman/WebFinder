FactoryGirl.define do

  factory :admin_user do
    sequence(:email) {|e| "user#{e}@example.com"}
    password "password123"
  end

end
