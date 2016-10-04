FactoryGirl.define do
  factory :country do
    name { FFaker::Address.country }

    trait :with_regions do
      transient do
        regions_count 3
      end

      after(:create) do |country, evaluator|
        create_list(:region, evaluator.regions_count, country: country)
      end
    end

    trait :with_environmental_laws do
      transient do
        laws_count 3
      end

      after(:create) do |country, evaluator|
        create_list(:environmental_law, evaluator.laws_count, country: country)
      end
    end

    factory :country_with_regions, traits: [:with_regions]
    factory :country_with_laws, traits: [:with_environmental_laws]
    factory :country_with_regions_and_laws, traits: [:with_regions,
                                                     :with_environmental_laws]

  end
end
