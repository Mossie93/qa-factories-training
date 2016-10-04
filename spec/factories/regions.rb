FactoryGirl.define do
  factory :region do
    country
    name { FFaker::Address.city }

    trait :with_birds do
      transient do
        birds_count 3
      end

      after(:create) do |region, enumerator|
        create_list(:bird, enumerator.birds_count, regions: [region]) #what should be used instead of :regions to make it work?
      end
    end

    factory :region_with_birds, traits: [:with_birds]

  end
end
