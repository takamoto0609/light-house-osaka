FactoryBot.define do
  factory :profile do
    sex_id                  {Faker::Number.between(from: 1, to: 2)}
    blood_type_id           {Faker::Number.between(from: 1, to: 5)}
    birth_day               {Faker::Number.number(digits: 8)}
    zodiac_sign_id          {Faker::Number.between(from: 1, to: 12)}
    age_group_id            {Faker::Number.between(from: 1, to: 10)}
    address_id              {Faker::Number.between(from: 1, to: 6)}
    occupation_id           {Faker::Number.between(from: 1, to: 8)}
    work_place              {Faker::Name.name}
    summary                 {Faker::Name.name}
    association :user, factory: :user
  end
end
