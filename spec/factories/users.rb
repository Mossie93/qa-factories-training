FactoryGirl.define do
  factory :user do
    first_name { FFaker::Name.first_name }
    last_name { FFaker::Name.last_name }
    email { FFaker::Internet.safe_email }
    password 'qwerty'
    password_confirmation 'qwerty'

    trait :photographer do
      role 'photographer'
    end

    trait :admin do
      role 'admin'
    end

    factory :user_as_photographer, traits: [:photographer]
    factory :user_as_admin, traits: [:admin]

  end
end
