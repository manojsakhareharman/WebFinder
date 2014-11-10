FactoryGirl.define do
  factory :vertical_market do
    sequence(:name) {|n| "Vertical Market#{n}"}
    #parent_id 1
  end

end
