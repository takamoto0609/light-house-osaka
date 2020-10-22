FactoryBot.define do
  factory :room do
    name                  {Faker::Name.name}
    content               {Faker::Name.name}
    association :user, factory: :user
  end
end