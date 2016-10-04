FactoryGirl.define do
  factory :environmental_law do
    country
    name do
      "#{FFaker::Education.school_name.capitalize} " \
      "#{FFaker::Food.fruit.capitalize} Law"
    end
    description { FFaker::HealthcareIpsum.sentence }

    trait :with_birds do
      transient do
        birds_count 3
      end

      after(:create) do |law, enumerator|
        create_list(:bird, enumerator.birds_count, environmental_laws: [law]) #what should i use instead of :environmental_law to make it work?
      end
    end

    factory :environmental_laws_with_birds, traits: [:with_birds]

  end
end
