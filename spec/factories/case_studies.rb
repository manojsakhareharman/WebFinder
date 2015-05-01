FactoryGirl.define do
  factory :case_study do
    sequence(:name) {|n| "MyString#{n}"}
    headline "CS Headline"
    description "CS Description"
    vertical_market
    banner { File.new(Rails.root.join('spec', 'fixtures', 'test.jpg')) }
    content "CS Content"
  end

end
