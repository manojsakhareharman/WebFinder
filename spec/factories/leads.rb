FactoryGirl.define do
  factory :lead do
    name "LeadName"
    company "LeadCompany"
    email "my@email.com"
    phone "555-5555"
    project_description "Project Description"
    source "MyString"
  end

end
