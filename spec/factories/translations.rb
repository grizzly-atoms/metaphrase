FactoryGirl.define do
  factory :translation do
    original_copy { Faker::Lorem.sentence }
    code "en-us"
    translated_copy { "#{original_copy}" }
    application_domain "default"
  end
end