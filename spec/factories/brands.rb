FactoryGirl.define do
  factory :brand do
    sequence(:name) {|n| "Brand #{n}"}
    url "http://www.brand.site"
  end

end
