
FactoryBot.define do

  factory :user do
    email { Faker::Internet.email }
    username { Faker::Name.unique.name }
    password {"password"}
    password_confirmation {"password"}
  end

  factory :phrase do
    user
    phrase { Faker::Name.unique.name }
    translation { 'Some translation'}
    slug { :phrase }

    trait :invalid do
      phrase { nil }
    end

    trait :update do
      phrase { Faker::Name.unique.name }
    end
  end

  factory :example do
    user
    phrase
    example { Faker::Name.unique.name}

    trait :invalid do
      example { nil }
    end
  end

end

