FactoryGirl.define do
  factory :case_study do
    sequence(:name) {|n| "MyString#{n}"}
    headline "CS Headline"
    description "CS Description"
    vertical_market
    content "CS Content"
  end

end
