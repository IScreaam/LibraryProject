FactoryGirl.define do
  factory :book do
    name { FFaker::Lorem.phrase }
    author_name { FFaker::Name.name }
    description { FFaker::Lorem.paragraph(10) }
    trait :with_user do
      user
      status :unavailable
    end
  end
end