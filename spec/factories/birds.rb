FactoryGirl.define do
  factory :bird do
    name { FFaker::Name.first_name }
    description { FFaker::HipsterIpsum.sentence }
    latin_name { FFaker::Lorem.words(2).join(' ').capitalize }

    trait :with_environmental_laws do
      transient do
        laws_count 3
      end

      after(:create) do |bird, enumerator|
        create_list(:environmental_law, enumerator.laws_count, birds: [bird])
      end
    end

    trait :with_regions do
      transient do
        regions_count 3
      end

      after(:create) do |bird, enumerator|
        create_list(:region, enumerator.regions_count, birds: [bird])
      end
    end

    factory :bird_with_laws, traits: [:with_environmental_laws]
    factory :bird_with_regions, traits: [:with_regions]
    factory :bird_with_regions_and_laws, traits: [:with_regions,
                                                  :with_environmental_laws]
  end
end
