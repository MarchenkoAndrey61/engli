
FactoryBot.define do

  factory :user do
    email { Faker::Internet.email }
    username { Faker::Name.unique.name }
    password {"password"}
    password_confirmation {"password"}
  end

  factory :phrase do
    user
    phrase { Faker::Movies::BackToTheFuture.quote }
    translation { 'Some translation'}
    slug { :phrase }

    trait :invalid do
      phrase { nil }
    end

    trait :update do
      phrase { Faker::Movies::Ghostbusters.quote }
    end
  end

  factory :example do
    user
    phrase
    example { Faker::Movies::BackToTheFuture.quote}

    trait :invalid do
      example { nil }
    end
  end

end

