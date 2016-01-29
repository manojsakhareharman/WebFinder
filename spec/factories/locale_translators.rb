FactoryGirl.define do
  factory :locale_translator do
    association :locale, factory: :available_locale
    association :translator, factory: :admin_user
  end

end
