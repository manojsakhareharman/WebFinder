FactoryGirl.define do
  factory :brand do
    sequence(:name) {|n| "Brand #{n}"}
    url "http://www.brand.site"
    logo { File.new(Rails.root.join('spec', 'fixtures', 'test.jpg')) }
    white_logo { File.new(Rails.root.join('spec', 'fixtures', 'test.jpg')) }
  end

end
