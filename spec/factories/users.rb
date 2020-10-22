FactoryBot.define do
  factory :user do
    family_name           {Faker::Name.name}
    given_name            {Faker::Name.name}
    family_name_kana      {Faker::Name.name}
    given_name_kana       {Faker::Name.name}
    email                 {Faker::Internet.free_email}
    password              {Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
  end
end